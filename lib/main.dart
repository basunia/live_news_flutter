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

  // final userNameRandom = getRandomString(5);
  // const userName = 'mahmud';
  // await mailRepository.register(username: userNameRandom, password: '123');
}











  
  ///http://api.mediastack.com/v1/news?access_key=51cbced675e27cc5e77152d564190025&sources=bbc&languages=en
  ///http://api.mediastack.com/v1/news?access_key=51cbced675e27cc5e77152d564190025&sources=bbc&languages=en
  // {
  // runApp(MaterialApp(
  //     home: Scaffold(
  //         appBar: AppBar(
  //           title: const Text('Mail Automation'),
  //         ),
  //         body: FutureBuilder<List<News>>(
  //           future: apiClient.getLiveNews(),
  //           builder: (context, snapshot) {
  //             return snapshot.hasData && snapshot.data!.isNotEmpty
  //                 ? Container(
  //                     color: Colors.black87,
  //                     child: ListView.builder(
  //                         itemCount: snapshot.data!.length,
  //                         itemBuilder: (context, i) {
  //                           final news = snapshot.data![i];
  //                           return ListTile(
  //                             textColor: Colors.white,
  //                             leading: Text('${i + 1}'),
  //                             // dense: true,
  //                             title: Text(
  //                               news.title,
  //                             ),
  //                             subtitle: Text(news.description),
  //                           );
  //                         }),
  //                   )
  //                 : const Center(child: Text('No data found'));
  //           },
  //         ))));

  

  // final domain = await apiClient.getDomains();
  // print('Domain $domain');

  // final userInfo = await apiClient.createAccount(
  //     address: '${getRandomString(5)}@${domain.domain}', password: '123');
  // print('Account info ===> $userInfo');

  // print(
  //     'Token ===> ${await apiClient.getToken(address: userInfo.emailId, password: '123')}');
  // final newsList = await apiClient.getLiveNews();
  // print(newsList);
// }
