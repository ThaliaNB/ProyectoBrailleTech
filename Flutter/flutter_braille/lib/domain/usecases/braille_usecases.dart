import 'dart:typed_data';

import 'package:flutter_braille/data/repositories/braille_repository.dart';
import 'package:flutter_braille/domain/models/data_result.dart';

class BrailleUseCases {
  final BrailleRepository _brailleRepository;
  BrailleUseCases(this._brailleRepository);

  Future<DataResult<String>> traduceText({
    required String text,
  }) =>
      _brailleRepository.traduceText(text: text);

  Future<DataResult<String>> sendMedia({
    required String ext,
    required Uint8List bytes,
  }) async =>
      await _brailleRepository.sendMedia(
        ext: ext,
        bytes: bytes,
      );
}
