import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

abstract class ImagePickerHelper {
  static void openImagePicker({
    required ValueChanged<File> onGet,
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            'Select Image Source',
            style: AppStyles.roboto18Regular.copyWith(
              color: AppColors.darkBlueColor,
            ),
          ),
          actions: [
            TextButton(
              child: Text('Gallery'),
              onPressed: () => openGallery(onGet: onGet, context: context),
            ),
            TextButton(
              child: Text('Camera'),
              onPressed: () => openCamera(onGet: onGet, context: context),
            ),
          ],
        );
      },
    );
  }

  static Future<void> openGallery({
    required ValueChanged<File> onGet,
    required BuildContext context,
  }) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      Navigator.of(context, rootNavigator: true).pop();
      onGet(File(image.path));
    }
  }

  static Future<void> openCamera({
    required ValueChanged<File> onGet,
    required BuildContext context,
  }) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      Navigator.of(context, rootNavigator: true).pop();
      onGet(File(image.path));
    }
  }
}