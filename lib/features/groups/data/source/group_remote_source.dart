import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/errors/exceptions.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/errors/error_model.dart';
import '../model/article_model.dart';
import '../model/podcast_model.dart';
import '../model/video_model.dart';

abstract class GroupRemoteSource {
  Future<List<ArticleModel>> getArticles();
  Future<List<VideoModel>> getAllVideos();
  Future<List<PodcastModel>> getAllPodcasts();
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
  @override
  Future<List<VideoModel>> getAllVideos() async {
    final response = await api.get(EndPoints.englishVideos);
    if (response.statusCode == 200) {
      final List<VideoModel> videos = (response.data as List)
          .map((video) => VideoModel.fromJson(video))
          .toList();
      return videos;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
  @override
  Future<List<PodcastModel>> getAllPodcasts() async {
    final response = await api.get(EndPoints.englishPodcasts);
    if (response.statusCode == 200) {
      final List<PodcastModel> podcasts = (response.data as List)
         .map((podcast) => PodcastModel.fromJson(podcast))
         .toList();
      return podcasts;
    }
    else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
