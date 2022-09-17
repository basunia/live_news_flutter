import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mail_automation/app.dart';
import 'package:mail_automation/mail_bloc_observer.dart';
import 'package:mail_automation/service_locator.dart';
import 'package:mail_automation/utils/localization.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // final mailRepository = MailRepository();
  // final apiClient = MailTmApiClient();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MailBlocObserver();
  final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  final services = ServiceLocator();

  /// Used hydrated bloc to persist data
  HydratedBlocOverrides.runZoned(() async {
    runApp(EasyLocalization(
      path: 'assets/locales',
      supportedLocales: Localization.locales,
      saveLocale: true,
      fallbackLocale: Localization.locales.localeUS,
      child: MailApp(mailRepository: services.mailRepository),
    ));
  }, storage: storage);
}
