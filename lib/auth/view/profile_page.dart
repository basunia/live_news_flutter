import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_automation/auth/bloc/auth_bloc.dart';
import 'package:mail_automation/auth/view/auth_page.dart';

import '../bloc/auth_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('profile').tr()),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32.0,
              ),
              Center(child: Text(state.account?.userId ?? '')),
              Center(child: Text(state.account?.emailId ?? '')),
              const SizedBox(
                height: 32.0,
              ),
              OutlinedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LogOutRequested());
                    // BlocProvider.of<AuthBloc>(context).add(LogOutRequested());
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const AuthPage()));
                  },
                  child: const Text('logout').tr()),
            ],
          );
        },
      ),
    );
  }
}
