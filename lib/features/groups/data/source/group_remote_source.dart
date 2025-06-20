import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/cache/cache_helper.dart';
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
  Future<List<ArticleModel>> searchArticles(String query);
  Future<List<ArticleModel>> getTop4Articles();
  Future<List<VideoModel>> getTop4Videos();
  Future<List<PodcastModel>> getTop4Podcasts();

}

class GroupRemoteSourceImpl implements GroupRemoteSource {
  final ApiConsumer api;
  final CacheHelper cacheHelper;
  GroupRemoteSourceImpl({required this.api, required this.cacheHelper});

  @override
  Future<List<ArticleModel>> getArticles() async {
    final response = await api.get(
        (cacheHelper.getData(key: ApiKey.lang) ?? 'en') == 'ar'
            ? EndPoints.arabicArticles
            : EndPoints.englishArticles);
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
    final response = await api.get(
        (cacheHelper.getData(key: ApiKey.lang) ?? 'en') == 'ar'
            ? EndPoints.arabicVideos
            : EndPoints.englishVideos);
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
    final response = await api.get(
        (cacheHelper.getData(key: ApiKey.lang) ?? 'en') != 'ar'
            ? EndPoints.arabicPodcasts
            : EndPoints.englishPodcasts);
    if (response.statusCode == 200) {
      final List<PodcastModel> podcasts = (response.data as List)
          .map((podcast) => PodcastModel.fromJson(podcast))
          .toList();
      return podcasts;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<ArticleModel>> searchArticles(String query) async {
    final response = await api.get(
      EndPoints.searchArticles,
      queryParameters: {'q': query},
    );
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
  Future<List<ArticleModel>> getTop4Articles() async {
    final response = await api.get(
        (cacheHelper.getData(key: ApiKey.lang) ?? 'en') == 'ar'
            ? EndPoints.top4ArabicArticles
            : EndPoints.top4EnglishArticles);
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
  Future<List<PodcastModel>> getTop4Podcasts() async {
    final response = await api.get(
        (cacheHelper.getData(key: ApiKey.lang) ?? 'en') != 'ar'
            ? EndPoints.top4Arabicpodcasts
            : EndPoints.top4Englishpodcasts);
    if (response.statusCode == 200) {
      final List<PodcastModel> podcasts = (response.data as List)
          .map((podcast) => PodcastModel.fromJson(podcast))
          .toList();
      return podcasts;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<VideoModel>> getTop4Videos() async {
    final response = await api.get(
        (cacheHelper.getData(key: ApiKey.lang) ?? 'en') == 'ar'
            ? EndPoints.top4ArabicVideos
            : EndPoints.top4EnglishVideos);
    if (response.statusCode == 200) {
      final List<VideoModel> videos = (response.data as List)
          .map((video) => VideoModel.fromJson(video))
          .toList();
      return videos;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
