import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_braille/domain/models/data_result.dart';
import 'package:flutter_braille/domain/usecases/braille_usecases.dart';
import 'package:flutter_braille/domain/usecases/upload_image_usecase.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mime/mime.dart';

class PredictionViewModel extends ChangeNotifier {
  final UploadImageUseCase _imageUseCase;
  final BrailleUseCases _brailleUseCases;
  PredictionViewModel(
    this._imageUseCase,
    this._brailleUseCases,
  );

  FlutterTts flutterTts = FlutterTts();
  late DataResult<bool> _saveTempRegisterData;

  DataResult<bool> get saveTempRegisterData => _saveTempRegisterData;
  init() async {
    _saveTempRegisterData = DataResult.initial();
    await flutterTts.setLanguage("es-ES");
  }

  void _saveTemporalRegisterData(DataResult<bool> result) {
    _saveTempRegisterData = result;
    notifyListeners();
  }

  Future<File?> pickGalery() async {
    _saveTemporalRegisterData(DataResult.loading());
    final result = await _imageUseCase.pickGalery();
    if (result.state == ResultState.exception) {
      _saveTemporalRegisterData(DataResult.success(false));
      return null;
    }
    _saveTemporalRegisterData(DataResult.success(true));
    return result.data;
  }

  Future<String?> saveDocumentMediaUser({
    required File file,
  }) async {
    _saveTemporalRegisterData(DataResult.loading());
    final fileBytes = file.readAsBytesSync();
    final extencionPicture = lookupMimeType(file.path) ?? 'image/jpeg';
    final result = await _brailleUseCases.sendMedia(
      ext: extencionPicture == 'application/pdf' ? 'pdf' : 'jpeg',
      bytes: fileBytes,
    );
    if (result.state == ResultState.exception) {
      _saveTemporalRegisterData(DataResult.success(false));
      return null;
    }
    return result.data;
  }

  Future speak(String text) async {
    await flutterTts.speak(text);
  }
}

enum DocumentOption { camera, gallery, document }

enum DocumentAction { confirm, tryItAgain }
