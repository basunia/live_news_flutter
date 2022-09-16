import 'package:flutter/material.dart';
import 'package:mail_repository/src/model/account.dart';
import 'package:mail_tm_api/mail_tm_api.dart' hide Account;

extension DomainX on Domain {
  String getAddress(String username) => '$username@$domain';
}

class MailRepository {
  MailRepository({MailTmApiClient? mailTmApiClient})
      : _mailTmApiClient = mailTmApiClient ?? MailTmApiClient();

  final MailTmApiClient _mailTmApiClient;

  Future<Account> register(
      {required String username, required String password}) async {
    final domain = await _mailTmApiClient.getDomains();
    debugPrint('Domain $domain');

    final userInfo = await _mailTmApiClient.createAccount(
        address: domain.getAddress(username), password: password);
    debugPrint('Account info ===> $userInfo');

    final String token = await _mailTmApiClient.getToken(
        address: userInfo.emailId, password: password);
    debugPrint('Token ===> $token');

    return Account(
        userId: userInfo.userId, emailId: userInfo.emailId, token: token);
  }

  Future<Account> login(
      {required String username, required String password}) async {
    final domain = await _mailTmApiClient.getDomains();
    debugPrint('Domain $domain');

    // final userInfo = await _mailTmApiClient.login(
    //     address: domain.getAddress(username), password: password);
    // debugPrint('Account info ===> $userInfo');

    final String token = await _mailTmApiClient.getToken(
        address: domain.getAddress(username), password: password);
    debugPrint('Token ===> $token');

    final userInfo = await _mailTmApiClient.getAccount(token: token);
    return Account(
        userId: userInfo.userId, emailId: userInfo.emailId, token: token);
  }
}
