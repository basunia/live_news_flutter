// import 'package:mail_tm_api/src/mail_tm_api_client.dart';
import 'package:mail_tm_api/mail_tm_api.dart';

void main(List<String> args) {
  print('In driver');
  final apiClient = MailTmApiClient();

  print('Domain ${apiClient.getDomains()}');
}
