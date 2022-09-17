import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mail_repository/mail_repository.dart';
import 'package:mail_tm_api/mail_tm_api.dart' hide Account;

import 'auth_state.dart';

part 'auth_event.dart';
// part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc({required MailRepository mailRepository})
      : _mailRepository = mailRepository,
        super(const AuthState()) {
    on<AlreadyLoginCheckRequested>(_onAlreadyLoginChecked);
    on<AuthReguested>(_onAuthRequested);
    on<PageChangeRequested>(_onPageChageRequested);
    on<LogOutRequested>(_onLogOutRequested);
  }

  final MailRepository _mailRepository;

  _onAlreadyLoginChecked(
      AlreadyLoginCheckRequested event, Emitter<AuthState> emit) {
    if (state.authStatus.isSuccess) {
      emit(state.copyWith());
    }
  }

  _onLogOutRequested(LogOutRequested event, Emitter<AuthState> emit) {
    clear();
  }

  _onPageChageRequested(PageChangeRequested event, Emitter<AuthState> emit) =>
      emit(event.requestedPageType.isLoginPage
          ? state.copyWith(
              authType: AuthType.login, authStatus: AuthStatus.initial)
          : state.copyWith(
              authType: AuthType.signUp, authStatus: AuthStatus.initial));

  _onAuthRequested(AuthReguested event, Emitter<AuthState> emit) async {
    try {
      if (event.authType.isLogin) {
        emit(state.copyWith(
            authType: AuthType.login, authStatus: AuthStatus.loading));
        final account = await _mailRepository.login(
            username: event.username, password: event.password);
        emit(state.copyWith(
            account: account,
            authType: AuthType.login,
            authStatus: AuthStatus.success));
      } else {
        emit(state.copyWith(
            authType: AuthType.signUp, authStatus: AuthStatus.loading));
        final account = await _mailRepository.register(
            username: event.username, password: event.password);
        emit(state.copyWith(
            account: account,
            authType: AuthType.signUp,
            authStatus: AuthStatus.success));
      }
    } on AccountAlreadyExistFailure {
      emit(state.copyWith(
          authType: AuthType.signUp,
          authStatus: AuthStatus.accountExistFailure));
    } on AccountNotExistFailure {
      emit(state.copyWith(authStatus: AuthStatus.accountNotExistFailure));
    } on Exception {
      emit(state.copyWith(authStatus: AuthStatus.failure));
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) => AuthState.fromJson(json);
  @override
  Map<String, dynamic>? toJson(AuthState state) => state.toJson();
}
