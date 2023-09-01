import 'dart:typed_data';

import 'package:flutter_braille/domain/models/data_result.dart';

abstract class BrailleRepository {
  Future<DataResult<String>> traduceText({
    required String text,
  });

  Future<DataResult<String>> sendMedia({
    required String ext,
    required Uint8List bytes,
  });
}
