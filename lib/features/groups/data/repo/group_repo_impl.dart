import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/groups/data/model/podcast_model.dart';

import '../model/article_model.dart';
import '../model/video_model.dart';
import '../source/group_remote_source.dart';
import 'group_repo.dart';

class GroupRepoImpl extends GroupRepo {
  final GroupRemoteSource remoteSource;

  GroupRepoImpl({required this.remoteSource});
  @override
  Future<Either<Failure, List<ArticleModel>>> getAllArticles() async {
    try {
      final articles = await remoteSource.getArticles();
      return right(articles);
    } on ServerException catch (e) {
      return left(  
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<VideoModel>>> getVideos() async {
    try {
      final videos = await remoteSource.getAllVideos();
      return right(videos);
    } on ServerException catch (e) {
      return left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<PodcastModel>>> getPodcasts() async {
    try {
      final podcasts = await remoteSource.getAllPodcasts();
      return right(podcasts);
    } on ServerException catch (e) {
      return left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> searchArticles(
      String query) async {
    try {
      final articles = await remoteSource.searchArticles(query);
      return right(articles);
    } on ServerException catch (e) {
      return left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> getTop4Articles() async {
    try {
      final articles = await remoteSource.getTop4Articles();
      return right(articles);
    } on ServerException catch (e) {
      return left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<PodcastModel>>> getTop4Podcasts() async {
    try {
      final podcasts = await remoteSource.getTop4Podcasts();
      return right(podcasts);
    } on ServerException catch (e) {
      return left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<VideoModel>>> getTop4Videos() async {
    try {
      final videos = await remoteSource.getTop4Videos();
      return right(videos);
    } on ServerException catch (e) {
      return left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }
}
