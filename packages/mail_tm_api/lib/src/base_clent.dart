import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String baseUrl = "https://api.mail.tm";
const String baseUrlNews = "http://api.mediastack.com/v1/";

final option = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 4 * 1000,
    receiveTimeout: 4 * 1000,
    headers: {"content-type": "application/json; charset=utf-8"});

final optionNews = BaseOptions(
    baseUrl: baseUrlNews,
    connectTimeout: 4 * 1000,
    receiveTimeout: 4 * 1000,
    headers: {"content-type": "application/json; charset=utf-8"});

Dio? _dio;

Dio get dio {
  if (_dio != null) return _dio!;
  _dio = Dio(option);
  _dio?.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));

  return _dio!;
}

Dio? _dioNews;
Dio get dioNews {
  if (_dioNews != null) return _dioNews!;
  _dioNews = Dio(optionNews);
  _dioNews?.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));

  return _dioNews!;
}
