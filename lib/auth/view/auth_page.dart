import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_automation/auth/bloc/auth_bloc.dart';
import 'package:mail_automation/auth/view/login_page.dart';
import 'package:mail_automation/auth/view/profile_page.dart';
import 'package:mail_automation/auth/view/signup_page.dart';
import 'package:mail_automation/auth/widget/login_loader.dart';
import 'package:mail_automation/auth/widget/registration_loader.dart';
import 'package:mail_automation/main/home_page.dart';
import 'package:mail_automation/utils/toast.dart';
import 'package:mail_repository/mail_repository.dart';

import '../bloc/auth_state.dart';

typedef AuthCallBack = void Function<T>(T, T);

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AuthView();
    // return BlocProvider(
    //   create: (context) =>
    //       AuthBloc(mailRepository: context.read<MailRepository>())
    //         ..add(AlreadyLoginCheckRequested()),
    //   child: const AuthView(),
    // );
  }
}

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BlocSelector<AuthBloc, AuthState, AuthType>(
        selector: (state) {
          return state.authType;
        },
        builder: (context, state) {
          return Text(state.isSignUp ? 'Sign Up Page' : 'LogIn Page');
        },
      )),
      // appBar: AppBar(
      //     title: Text(context.select((AuthState e) => e.authType).isSignUp
      //         ? 'Sign Up Page'
      //         : 'LogIn Page')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state.authStatus) {
            case AuthStatus.success:
              //TODO: error
              Navigator.push(context, HomePage.route(context: context));
              break;
            case AuthStatus.failure:
              showMessage(context, 'Something went wrong!');
              break;
            case AuthStatus.accountExistFailure:
              showMessage(
                  context, 'Account already exist! \nYou need to log In');
              break;
            case AuthStatus.accountNotExistFailure:
              showMessage(
                  context, 'Account not found! \nYou need sign up first');
              break;
            // case AuthStatus.alreadyLoggedIn:

            //   break;
            default:
          }
        },
        builder: (context, state) {
          if (state.authType.isLogin) {
            switch (state.authStatus) {
              case AuthStatus.loading:
                return const LoginLoader();
              case AuthStatus.failure:
              case AuthStatus.initial:
              default:
                return getLogInPage(context);
            }
          } else {
            switch (state.authStatus) {
              case AuthStatus.loading:
                return const SignUpLoader();
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
          if (userName.toString().trim().isEmpty &&
              passWord.toString().trim().isEmpty) {
            showMessage(context, 'Username and Password can not be empty!');
            return;
          }
          context.read<AuthBloc>().add(AuthReguested(
              authType: AuthType.login,
              username: userName.toString().trim(),
              password: passWord.toString().trim()));
        },
      );

  Widget getSignUpPage(BuildContext context) => SignUpPage(onPageChange: () {
        context
            .read<AuthBloc>()
            .add(const PageChangeRequested(requestedPageType: PageType.login));
      }, onSignUp: <String>(String userName, String passWord) {
        if (userName.toString().trim().isEmpty &&
            passWord.toString().trim().isEmpty) {
          showMessage(context, 'Username and Password can not be empty!');
          return;
        }
        context.read<AuthBloc>().add(AuthReguested(
            authType: AuthType.signUp,
            username: userName.toString().trim(),
            password: passWord.toString().trim()));
      });
}
