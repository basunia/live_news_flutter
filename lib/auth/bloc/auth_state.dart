part of 'auth_bloc.dart';

extension AuthStatusX on AuthStatus {
  bool get isInitial => this == AuthStatus.initial;
  bool get isLoading => this == AuthStatus.loading;
  bool get isSuccess => this == AuthStatus.success;
  bool get isFailure => this == AuthStatus.failure;
  bool get isNoConnection => this == AuthStatus.noConnection;
}

extension AuthTypeX on AuthType {
  bool get isLogin => this == AuthType.login;
  bool get isSignUp => this == AuthType.signUp;
}

enum AuthStatus { initial, loading, success, failure, noConnection }

enum AuthType { signUp, login }

// abstract class AuthState extends Equatable {
//   abstract final Account? account;
//   abstract final AuthStatus authStatus;

//   @override
//   List<Object?> get props => [];
// }

class AuthState extends Equatable {
  const AuthState(
      {this.account,
      this.authType = AuthType.signUp,
      this.authStatus = AuthStatus.initial});

  final Account? account;
  final AuthType authType;
  final AuthStatus authStatus;

  AuthState copyWith(
      {Account? account, AuthType? authType, AuthStatus? authStatus}) {
    return AuthState(
      account: account ?? this.account,
      authType: authType ?? this.authType,
      authStatus: authStatus ?? this.authStatus,
    );
  }

  @override
  List<Object?> get props => [account, authType, authStatus];
}

// class LoginSate extends AuthState {
//   LoginSate({this.account, this.authStatus = AuthStatus.initial});
//   @override
//   final Account? account;
//   @override
//   final AuthStatus authStatus;
//   @override
//   List<Object?> get props => [account, authStatus];
// }
