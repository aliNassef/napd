import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/search_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, SearchModel>> search(String query);
}
