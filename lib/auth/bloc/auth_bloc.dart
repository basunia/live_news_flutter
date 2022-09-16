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
          ? state.copyWith(authType: AuthType.login)
          : state.copyWith(authType: AuthType.signUp));

  _onAuthRequested(AuthReguested event, Emitter<AuthState> emit) async {
    try {
      if (event.authType.isLogin) {
        final account = await _mailRepository.login(
            username: event.username, password: event.password);
        emit(state.copyWith(
            account: account,
            authType: AuthType.login,
            authStatus: AuthStatus.success));
      } else {
        final account = await _mailRepository.register(
            username: event.username, password: event.password);
        emit(state.copyWith(
            account: account,
            authType: AuthType.signUp,
            authStatus: AuthStatus.success));
      }
    } on AccountNotFoundFailure {
      emit(state.copyWith(authStatus: AuthStatus.failure));
    } on RegistrationRequestFailure {
      emit(state.copyWith(authStatus: AuthStatus.failure));
    } on Exception {
      emit(state.copyWith(authStatus: AuthStatus.failure));
    }
  }
}
