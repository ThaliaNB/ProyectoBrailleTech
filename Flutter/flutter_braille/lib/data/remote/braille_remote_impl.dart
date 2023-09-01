import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_braille/data/repositories/braille_repository.dart';
import 'package:flutter_braille/domain/models/data_result.dart';
import 'package:flutter_braille/domain/models/jetz_exception.dart';

class BrailleRemoteImpl extends BrailleRepository {
  final Dio _client;
  BrailleRemoteImpl(this._client);
  @override
  Future<DataResult<String>> traduceText({
    required String text,
  }) async {
    try {
      final response = await _client.post('/braille/convert-text', data: {'text': text});
      final textConvert = response.data["text_convert"];
      return DataResult.success(textConvert);
    } catch (e) {
      return DataResult.exception(JetzException.fromException(e, StackTrace.current));
    }
  }

  @override
  Future<DataResult<String>> sendMedia({required String ext, required Uint8List bytes}) async {
    try {
      final byteImage = base64Encode(bytes);
      final response = await _client.post('/braille/prediction', data: {'image': byteImage});
      final textConvert = response.data["text_convert"];
      return DataResult.success(textConvert);
    } catch (e) {
      return DataResult.exception(JetzException.fromException(e, StackTrace.current));
    }
  }
}
