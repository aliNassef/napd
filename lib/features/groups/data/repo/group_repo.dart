import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/failure.dart';

import '../model/article_model.dart';
import '../model/podcast_model.dart';
import '../model/video_model.dart';

abstract class GroupRepo {
  Future<Either<Failure, List<ArticleModel>>> getAllArticles();
  Future<Either<Failure, List<VideoModel>>> getVideos();
  Future<Either<Failure, List<PodcastModel>>> getPodcasts();
  Future<Either<Failure, List<ArticleModel>>> searchArticles(String query);
  Future<Either<Failure, List<ArticleModel>>> getTop4Articles();
  Future<Either<Failure, List<VideoModel>>> getTop4Videos();
  Future<Either<Failure, List<PodcastModel>>> getTop4Podcasts();
}
