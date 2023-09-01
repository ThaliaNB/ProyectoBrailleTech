import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_braille/core/env/config.dart';

class JetzClient extends DioForNative implements Dio {
  JetzClient() {
    final config = Config();
    final options = BaseOptions(
      baseUrl: config.baseUrl!,
      // headers: {'x-api-key': config.jetzApiKey},
    );
    this.options = options;
    interceptors.add(InterceptorsWrapper(
      onRequest: onRequest,
    ));
  }

  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }
}
