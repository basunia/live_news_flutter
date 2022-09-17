import 'package:easy_localization/easy_localization.dart';
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

import '../../main/home_nav_drawer.dart';
import '../bloc/auth_state.dart';

typedef AuthCallBack = void Function<T>(T, T);

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, AuthStatus>(
      selector: (state) {
        return state.authStatus;
      },
      builder: (context, state) {
        return state.isSuccess ? const HomePage() : const AuthView();
      },
    );
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
      drawer: const NavigationDrawer(),
      appBar: AppBar(
          title: BlocSelector<AuthBloc, AuthState, AuthType>(
        selector: (state) {
          return state.authType;
        },
        builder: (context, state) {
          return Text(state.isSignUp ? 'sign_up_page' : 'login_page').tr();
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
              // Navigator.push(context, HomePage.route(context: context));
              break;
            case AuthStatus.failure:
              showMessage(context, 'erorr_message');
              break;
            case AuthStatus.accountExistFailure:
              showMessage(context, 'msg_already_registered');
              break;
            case AuthStatus.accountNotExistFailure:
              showMessage(context, 'msg_account_not_found');
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
            showMessage(context, 'msg_empty_username_password');
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
          showMessage(context, 'msg_empty_username_password');
          return;
        }
        context.read<AuthBloc>().add(AuthReguested(
            authType: AuthType.signUp,
            username: userName.toString().trim(),
            password: passWord.toString().trim()));
      });
}
