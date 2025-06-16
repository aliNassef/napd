import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/shop/data/model/product_model.dart';
import 'package:napd/features/shop/data/repo/shop_repo.dart';

import '../source/shop_remote_source.dart';

class ShopRepoImpl extends ShopRepo {
  final ShopRemoteSource remoteSource;

  ShopRepoImpl({required this.remoteSource});

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final products = await remoteSource.getProducts();
      return Right(products);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}