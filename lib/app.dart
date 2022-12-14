import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_automation/auth/view/auth_page.dart';
import 'package:mail_automation/settings/cubit/settings_cubit.dart';
import 'package:mail_automation/settings/cubit/settings_state.dart';
import 'package:mail_automation/utils/themes.dart';
import 'package:mail_repository/mail_repository.dart';

import 'auth/bloc/auth_bloc.dart';
import 'news/bloc/news_bloc.dart';

class MailApp extends StatelessWidget {
  const MailApp({Key? key, required MailRepository mailRepository})
      : _mailRepository = mailRepository,
        super(key: key);

  final MailRepository _mailRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _mailRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(mailRepository: context.read<MailRepository>())
                  ..add(AlreadyLoginCheckRequested()),
          ),
          BlocProvider(
            create: (context) =>
                NewsBloc(mailRepository: context.read<MailRepository>()),
          ),
          BlocProvider(
            create: (context) => SettingsCubit(),
          ),
        ],
        child: MailAppView(),
      ),
    );
  }
}

class MailAppView extends StatelessWidget {
  MailAppView({Key? key}) : super(key: key);
  bool needRebuild = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: ((previous, current) {
        if (previous != current) {
          needRebuild = true;
        }
        return needRebuild;
      }),
      builder: (context, state) {
        debugPrint(
            'Locale id ${state.localeId}, ${context.locale.toStringWithSeparator()}');
        debugPrint('Theme id ${state.themeId},');
        if (needRebuild) {
          _rebuildAllChildren(context);
        }
        return MaterialApp(
          title: 'Live News',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme:
              state.themeId == 0 ? ColorsLight.themeData : ColorsDark.themeData,
          home: Builder(builder: (context) {
            debugPrint(
                'Locale id ${state.localeId}, ${context.locale.toStringWithSeparator()}');

            return const AuthPage();
          }),
        );
      },
    );
  }

  /// Needed for updating locale
  /// https://stackoverflow.com/a/58513635/8198725
  /// TODO: we can overcome the issue by using [getx] etc
  void _rebuildAllChildren(BuildContext context) {
    debugPrint('Rebuilding children..');
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
