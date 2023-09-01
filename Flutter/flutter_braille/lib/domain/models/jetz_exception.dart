import 'package:dio/dio.dart';

class JetzException implements Exception {
  JetzException({required this.code, this.message});

  final String code;
  final String? message;

  factory JetzException.fromException(dynamic e, StackTrace? s) {
    late JetzException _instance;

    if (e is DioError) {
      _instance = JetzException._fromDioError(e);
    } else if (e is JetzException) {
      _instance = e;
    } else {
      _instance = JetzException(code: 'unexpected_error');
    }

    return _instance;
  }

  factory JetzException._fromDioError(DioError e) {
    final request = e.requestOptions;

    String code = 'request_unknow';

    return JetzException(code: code);
  }
}
