import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerHelper {
  static Future<void> openGallery({
    required ValueChanged<File> onGet,
  }) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      onGet(File(image.path));
    }
  }

  static Future<void> openCamera({
    required ValueChanged<File> onGet,
  }) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      onGet(File(image.path));
    }
  }
}
