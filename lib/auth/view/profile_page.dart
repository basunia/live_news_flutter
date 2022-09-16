import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_automation/auth/bloc/auth_bloc.dart';
import 'package:mail_automation/auth/view/auth_page.dart';
import 'package:mail_repository/mail_repository.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.profile}) : super(key: key);

  static Route<void> route({required BuildContext context, Account? profile}) {
    return MaterialPageRoute(
      fullscreenDialog: false,
      builder: (_) => BlocProvider.value(
        value: context.read<AuthBloc>(),
        child: ProfilePage(profile: profile),
      ),
    );
  }

  final Account? profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32.0,
          ),
          Center(child: Text(profile?.userId ?? '')),
          Center(child: Text(profile?.emailId ?? '')),
          const SizedBox(
            height: 32.0,
          ),
          OutlinedButton(
              onPressed: () {
                context.read<AuthBloc>().add(LogOutRequested());
                // BlocProvider.of<AuthBloc>(context).add(LogOutRequested());
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const AuthPage()));
              },
              child: const Text('Log out')),
        ],
      ),
    );
  }
}
