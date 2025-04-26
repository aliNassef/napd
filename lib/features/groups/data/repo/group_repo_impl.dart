import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/core/errors/failure.dart';

import '../model/article_model.dart';
import '../source/group_remote_source.dart';
import 'group_repo.dart';

class GroupRepoImpl extends GroupRepo {
  final GroupRemoteSource remoteSource;

  GroupRepoImpl({required this.remoteSource});
  @override
  Future<Either<Failure, List<ArticleModel>>> getGroups() async {
    try {
      final articles = await remoteSource.getArticles();
      return right(articles);
    } on ServerException catch (e) {
      return left(Failure(
        errMessage: e.errorModel.errorMessage,
      ));
    }
  }
}
