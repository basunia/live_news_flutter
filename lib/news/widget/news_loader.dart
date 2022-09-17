import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NewsLoader extends StatelessWidget {
  const NewsLoader({super.key});

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
            'msg_news_fetch',
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
