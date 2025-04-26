import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/errors/exceptions.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/errors/error_model.dart';
import '../model/article_model.dart';

abstract class GroupRemoteSource {
  Future<List<ArticleModel>> getArticles();
}

class GroupRemoteSourceImpl implements GroupRemoteSource {
  final ApiConsumer api;

  GroupRemoteSourceImpl({required this.api});

  @override
  Future<List<ArticleModel>> getArticles() async {
    final response = await api.get(EndPoints.articles);
    if (response.statusCode == 200) {
      final List<ArticleModel> articles = (response.data as List)
          .map((article) => ArticleModel.fromJson(article))
          .toList();
      return articles;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
