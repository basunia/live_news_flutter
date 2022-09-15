import 'package:flutter/material.dart';
import 'package:mail_automation/utils/random_chars.dart';
import 'package:mail_tm_api/mail_tm_api.dart';

void main() async {
  final apiClient = MailTmApiClient();

  ///http://api.mediastack.com/v1/news?access_key=51cbced675e27cc5e77152d564190025&sources=bbc&languages=en
  ///http://api.mediastack.com/v1/news?access_key=51cbced675e27cc5e77152d564190025&sources=bbc&languages=en

  runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Mail Automation'),
          ),
          body: const Text('Mail Automaton'))));

  // final domain = await apiClient.getDomains();
  // print('Domain $domain');

  // final userInfo = await apiClient.createAccount(
  //     address: '${getRandomString(5)}@${domain.domain}', password: '123');
  // print('Account info ===> $userInfo');

  // print(
  //     'Token ===> ${await apiClient.getToken(address: userInfo.emailId, password: '123')}');
  final newsList = await apiClient.getLiveNews();
  print(newsList);
}
