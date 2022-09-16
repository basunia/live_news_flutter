import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginLoader extends StatelessWidget {
  const LoginLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 48.0,
        ),
        Center(
          child: Text(
            'Login In In progress...',
            style: theme.textTheme.headline5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircularProgressIndicator(color: theme.primaryColor),
        ),
      ],
    );
  }
}
