import 'dart:io';

class GallreyInputModel {
  final String description;
  final File imgae;

  const GallreyInputModel({required this.description, required this.imgae});

 Map<String, dynamic> toJson() {
    return {
      'Description': description,
      'Imgae': imgae,
    };
  }
}