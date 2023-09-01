import 'dart:io';

import 'package:flutter_braille/data/repositories/image_repository.dart';
import 'package:flutter_braille/domain/models/data_result.dart';

class UploadImageUseCase {
  UploadImageUseCase(this._imageRepository);

  final ImageRepository _imageRepository;

  Future<DataResult<File>> pickCamera() async => await _imageRepository.pickImageInCamera();

  Future<DataResult<File>> pickGalery() async => await _imageRepository.pickImageInGalery();
}
