import 'package:dio/dio.dart';
import 'package:napd/core/errors/exceptions.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/error_model.dart';
import '../model/product_model.dart';

abstract class ShopRemoteSource {
  Future<List<ProductModel>> getProducts();
}

class ShopRemoteSourceImpl implements ShopRemoteSource {
  final Dio dio;

  ShopRemoteSourceImpl({required this.dio});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get(EndPoints.shop);
      return response.data
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
    } catch (e) {
      if (e is DioException) {
        handleDioException(e);
      }
      throw ServerException(
        ErrorModel.fromJson(e as Map<String, dynamic>),
      );
    }
  }
}
