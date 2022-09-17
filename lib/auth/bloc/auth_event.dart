part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthReguested extends AuthEvent {
  const AuthReguested(
      {required this.authType, required this.username, required this.password});

  final String username;

  final String password;
  final AuthType authType;
}

extension PageTypeX on PageType {
  bool get isLoginPage => this == PageType.login;
  bool get isSignUpPage => this == PageType.signUp;
}

enum PageType { signUp, login }

class PageChangeRequested extends AuthEvent {
  const PageChangeRequested({
    required this.requestedPageType,
  });

  final PageType requestedPageType;
}

class AlreadyLoginCheckRequested extends AuthEvent {}

class LogOutRequested extends AuthEvent {}


// class LoginRequested extends AuthEvent {
//   const LoginRequested({required this.username, required this.password});
//   @override
//   final String username;
//   @override
//   final String password;
// }
