import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/failure.dart';

import '../model/article_model.dart';

abstract class GroupRepo {
  Future<Either<Failure, List<ArticleModel>>> getGroups();
}
