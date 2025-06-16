import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/product_model.dart';

abstract class ShopRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}