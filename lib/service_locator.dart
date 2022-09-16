import 'package:mail_repository/mail_repository.dart';
import 'package:mail_tm_api/mail_tm_api.dart';

class ServiceLocator {
  MailTmApiClient? _mailTmApiClient;
  MailTmApiClient get mailTmApiClient {
    return _mailTmApiClient ?? (_mailTmApiClient = MailTmApiClient());
  }

  MailRepository? _mailRepository;
  MailRepository get mailRepository =>
      _mailRepository ??
      (_mailRepository = MailRepository(mailTmApiClient: mailTmApiClient));
}
