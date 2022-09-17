import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_automation/auth/bloc/auth_bloc.dart';

import '../bloc/auth_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('profile').tr()),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32.0,
              ),
              Card(
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        'User Id',
                        style: theme.textTheme.caption,
                      )),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Center(child: Text(state.account?.userId ?? '')),
                      const SizedBox(
                        height: 18.0,
                      ),
                      Center(
                          child: Text(
                        'User email',
                        style: theme.textTheme.caption,
                      )),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Center(child: Text(state.account?.emailId ?? '')),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              OutlinedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LogOutRequested());
                  },
                  child: const Text('logout').tr()),
            ],
          );
        },
      ),
    );
  }
}
