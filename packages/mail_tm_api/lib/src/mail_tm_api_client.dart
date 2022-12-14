import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mail_tm_api/src/base_clent.dart';
import 'package:mail_tm_api/src/model/news.dart';

import 'model/account.dart';
import 'model/domain.dart';

/// Exception thrown when domain fetch fails.
class DomainRequestFailure implements Exception {
  @override
  String toString() => '$runtimeType';
}

/// Exception thrown when the provided domain list is not found.
class DomainNotFoundFailure implements Exception {
  @override
  String toString() => '$runtimeType';
}

/// Exception thrown when token request fails.
class TokenRequestFailure implements Exception {}

/// Exception thrown when the token is not found.
class TokenNotFoundFailure implements Exception {
  @override
  String toString() => '$runtimeType';
}

/// Exception thrown when account request fails.
class AccountRequestFailure implements Exception {}

/// Exception thrown when the account is not found.
class AccountNotFoundFailure implements Exception {
  @override
  String toString() => '$runtimeType';
}

/// Exception thrown when registration process fails.
class RegistrationRequestFailure implements Exception {
  @override
  String toString() => '$runtimeType';
}

/// Exception thrown when the provided account info is not found.
class AccountAlreadyExistFailure implements Exception {
  @override
  String toString() => '$runtimeType';
}

/// Exception thrown when news request fails.
class NewsRequestFailure implements Exception {
  @override
  String toString() => '$runtimeType';
}

class AccountNotExistFailure implements Exception {
  @override
  String toString() => '$runtimeType';
}

/// Exception thrown when the news is not found.
class NewsNotFoundFailure implements Exception {}

class MailTmApiClient {
  MailTmApiClient({Dio? apiClient}) : _apiClient = apiClient ?? dio;

  final Dio _apiClient;

  Future<Domain> getDomains() async {
    try {
      final response = await _apiClient.get(
        '/domains',
      );

      if (response.statusCode != 200) {
        throw DomainRequestFailure();
      }
      if (response.data['hydra:member'] == null) {
        throw DomainNotFoundFailure();
      }
      List<Domain> domains = response.data['hydra:member']
          .map<Domain>((e) => Domain.fromJson(e))
          .toList();
      return domains.first;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw DomainRequestFailure();
    }
  }

  Future<Account> createAccount(
      {required String address, required String password}) async {
    try {
      final response = await _apiClient
          .post('/accounts', data: {"address": address, "password": password});

      if (response.statusCode != 201) {
        throw RegistrationRequestFailure();
      }
      if ((response.data as Map<String, dynamic>).isEmpty) {
        throw AccountNotFoundFailure();
      }
      Account account = Account.fromJson(response.data);

      return account;
    } on DioError catch (e) {
      debugPrint('Status code ==> ${e.response?.statusCode}');
      if (e.response?.statusCode == 422) {
        throw AccountAlreadyExistFailure();
      } else {
        rethrow;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  ///====================token=====================///
  Future<String> getToken(
      {required String address, required String password}) async {
    try {
      final response = await _apiClient
          .post('/token', data: {"address": address, "password": password});

      if (response.statusCode != 200) {
        throw AccountNotExistFailure();
      }
      if ((response.data as Map<String, dynamic>).isEmpty) {
        throw TokenNotFoundFailure();
      }
      String token = response.data['token'];

      return token;
    } on DioError catch (e) {
      debugPrint('Status code ==> ${e.response?.statusCode}');
      if (e.response?.statusCode == 401) {
        throw AccountNotExistFailure();
      } else {
        rethrow;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  //============get profile info============//
  Future<Account> getAccount({
    required String token,
  }) async {
    try {
      final headers = {'Authorization': 'Bearer $token'};
      _apiClient.options.headers = headers;
      final response = await _apiClient.get(
        '/me',
      );

      if (response.statusCode != 200) {
        throw AccountRequestFailure();
      }
      if ((response.data as Map<String, dynamic>).isEmpty) {
        throw AccountNotFoundFailure();
      }
      Account account = Account.fromJson(response.data);

      return account;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  //==========news api=========================//
  static const String apiKey = '51cbced675e27cc5e77152d564190025';
  Future<List<News>> getLiveNews(
      {String sources = 'bbc,cnn', String languages = 'en'}) async {
    try {
      final response = await dioNews.get('/news', queryParameters: {
        "access_key": apiKey,
        "sources": sources,
        "languages": languages
      });

      if (response.statusCode != 200) {
        throw NewsRequestFailure();
      }
      if ((response.data as Map<String, dynamic>).isEmpty) {
        throw NewsNotFoundFailure();
      }
      List<News> newsList =
          response.data['data'].map<News>((e) => News.fromJson(e)).toList();

      return newsList;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
