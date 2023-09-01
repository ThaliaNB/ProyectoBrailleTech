import 'package:flutter_braille/domain/models/data_result.dart';

abstract class SpeechRepository {
  DataResult<bool> toggleRecording({
    required Function(String text) onResult,
  });
}
