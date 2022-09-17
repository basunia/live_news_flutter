import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpLoader extends StatelessWidget {
  const SignUpLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 48.0,
        ),
        Center(
          child: Text(
            'msg_sign_in_progress',
            style: theme.textTheme.headline5,
          ).tr(),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircularProgressIndicator(color: theme.primaryColor),
        ),
      ],
    );
  }
}
