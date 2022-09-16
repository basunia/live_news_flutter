import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mail_repository/mail_repository.dart';
import 'package:mail_repository/src/model/account.dart';
import 'package:mail_tm_api/mail_tm_api.dart' hide Account;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required MailRepository mailRepository})
      : _mailRepository = mailRepository,
        super(const AuthState()) {
    on<AuthReguested>(_onAuthRequested);
    on<PageChangeRequested>(_onPageChageRequested);
  }

  final MailRepository _mailRepository;

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
}
