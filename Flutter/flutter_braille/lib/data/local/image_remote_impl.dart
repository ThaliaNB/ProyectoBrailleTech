import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_braille/data/repositories/image_repository.dart';
import 'package:flutter_braille/domain/models/data_result.dart';
import 'package:flutter_braille/domain/models/jetz_exception.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageRemoteImpl extends ImageRepository {
  ImageRemoteImpl(this._imagePicker);

  final ImagePicker _imagePicker;

  Future<File?> _cropImage(String path) async {
    final cropImage = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Barille App',
          toolbarColor: Colors.blueAccent,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      ],
    );

    if (cropImage == null) return null;

    return File(cropImage.path);
  }

  @override
  Future<DataResult<File>> pickImageInCamera() async {
    try {
      //question for jato
      final photo = await _imagePicker.pickImage(
        source: ImageSource.camera,
        //maxWidth: 500,
        imageQuality: 80,
      );

      if (photo == null) return DataResult.exception(JetzException(code: 'CI002'));

      final croppedFile = await _cropImage(photo.path);

      if (croppedFile == null) return DataResult.exception(JetzException(code: 'CI002'));

      return DataResult.success(croppedFile);
    } catch (e) {
      return DataResult.exception(JetzException.fromException(e, StackTrace.current));
    }
  }

  @override
  Future<DataResult<File>> pickImageInGalery() async {
    try {
      final photo = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        //maxWidth: 250,
        imageQuality: 90,
      );

      if (photo == null) return DataResult.exception(JetzException(code: 'CI003'));

      final croppedFile = await _cropImage(photo.path);

      if (croppedFile == null) return DataResult.exception(JetzException(code: 'CI003'));

      return DataResult.success(croppedFile);
    } catch (e) {
      return DataResult.exception(JetzException.fromException(e, StackTrace.current));
    }
  }
}
