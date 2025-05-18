import 'package:dio/dio.dart';
import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/errors/error_model.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/features/home/data/model/gallrey_input_model.dart';
import 'package:napd/features/home/data/model/gallrey_model.dart';

import '../../../../core/api/api_consumer.dart';

abstract class GallreyRemoteSource {
  Future<void> uploadGallreyImage(GallreyInputModel gallreyInputModel);
  Future<void> deleteGallreyImage(String id);
  Future<List<GallreyModel>> getGallreyImages();
}

class GallreyRemoteSourceImpl implements GallreyRemoteSource {
  final ApiConsumer apiConsumer;

  const GallreyRemoteSourceImpl({required this.apiConsumer});

  @override
  Future<void> uploadGallreyImage(GallreyInputModel gallreyInputModel) async {
    try {
      // Create a MultipartFile from the File object
      final fileName = gallreyInputModel.imgae.path.split('/').last;
      final multipartFile = await MultipartFile.fromFile(
        gallreyInputModel.imgae.path,
        filename: fileName,
      );

      final formData = {
        'Image': [
          multipartFile
        ], // Changed field name from 'files' to 'Image' as required by the API
        'Description': gallreyInputModel.description
      };

      final response = await apiConsumer.postDataWithImage(
        EndPoints.addGallrey,
        data: formData,
        isFromData: true,
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return;
      } else {
        throw ServerException(ErrorModel.fromJson(response.data));
      }
    } catch (e) {
      print('Error uploading gallery image: $e');
      rethrow;
    }
  }

  @override
  Future<List<GallreyModel>> getGallreyImages() async {
    final response = await apiConsumer.get(
      EndPoints.getGallrey,
    );
    if (response.statusCode == 200) {
      final gallreyImages = response.data as List<dynamic>;
      final gallreyImagesList =
          gallreyImages.map((e) => GallreyModel.fromJson(e)).toList();
      return gallreyImagesList;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<void> deleteGallreyImage(String id) async {
    final response = await apiConsumer.delete(
      EndPoints.deleteGallrey,
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
