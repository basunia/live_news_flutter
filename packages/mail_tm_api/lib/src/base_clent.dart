import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String baseUrl = "https://api.mail.tm";

final option = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 4 * 1000,
    receiveTimeout: 4 * 1000,
    headers: {"content-type": "application/json; charset=utf-8"});

Dio? _dio;
Dio get dio {
  if (_dio != null) return _dio!;
  final Dio dio = Dio(option);
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));

  return dio;
}
