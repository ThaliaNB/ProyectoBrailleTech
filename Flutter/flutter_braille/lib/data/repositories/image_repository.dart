import 'dart:io';

import 'package:flutter_braille/domain/models/data_result.dart';

abstract class ImageRepository {
  Future<DataResult<File>> pickImageInCamera();
  Future<DataResult<File>> pickImageInGalery();
}
