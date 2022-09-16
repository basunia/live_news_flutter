import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_automation/auth/bloc/auth_bloc.dart';
import 'package:mail_automation/auth/view/login_page.dart';
import 'package:mail_automation/auth/view/signup_page.dart';
import 'package:mail_repository/mail_repository.dart';

typedef AuthCallBack = void Function<T>(T, T);

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(mailRepository: context.read<MailRepository>()),
      child: const AuthView(),
    );
  }
}

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mail Authomation')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.authType.isLogin) {
            switch (state.authStatus) {
              case AuthStatus.loading:
                return const CircularProgressIndicator();
              case AuthStatus.failure:
              case AuthStatus.initial:
              default:
                return getLogInPage(context);
            }
          } else {
            switch (state.authStatus) {
              case AuthStatus.loading:
                return const CircularProgressIndicator();
              case AuthStatus.failure:
              case AuthStatus.initial:
              default:
                return getSignUpPage(context);
            }
          }
          //  else if (state.authType.isSignIn && state.authStatus.isSuccess) {
          // } else if (state.authType.isSignIn && state.authStatus.isSuccess) {}

          // return state.authType.isSignIn && state.authStatus.isSuccess
          //     ? LoginPage(
          //         onLogIn: <String>(userName, passWord) {
          //           context.read<AuthBloc>().add(AuthReguested(
          //               authType: AuthType.signIn,
          //               username: userName.toString(),
          //               password: passWord.toString()));
          //         },
          //       )
          //     : SignUpPage(onSignUp: <String>(userName, passWord) {
          //         context.read<AuthBloc>().add(AuthReguested(
          //             authType: AuthType.signUp,
          //             username: userName.toString(),
          //             password: passWord.toString()));
          //       });
        },
      ),
    );
  }

  Widget getLogInPage(BuildContext context) => LoginPage(
        onPageChange: () {
          context.read<AuthBloc>().add(
              const PageChangeRequested(requestedPageType: PageType.signUp));
        },
        onLogIn: <String>(userName, passWord) {
          context.read<AuthBloc>().add(AuthReguested(
              authType: AuthType.login,
              username: userName.toString(),
              password: passWord.toString()));
        },
      );

  Widget getSignUpPage(BuildContext context) => SignUpPage(onPageChange: () {
        context
            .read<AuthBloc>()
            .add(const PageChangeRequested(requestedPageType: PageType.login));
      }, onSignUp: <String>(userName, passWord) {
        context.read<AuthBloc>().add(AuthReguested(
            authType: AuthType.signUp,
            username: userName.toString(),
            password: passWord.toString()));
      });
}
