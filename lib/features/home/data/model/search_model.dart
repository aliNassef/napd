import 'package:napd/features/groups/data/model/article_model.dart';
import 'package:napd/features/nursery/data/models/hospital_model.dart';
import 'package:napd/features/parenting_resources/data/models/activity_model.dart';

class SearchModel {
  final List<HospitalModel> hospitals;
  final List<ArticleModel> articles;
  final List<ActivityModel> activities;

  SearchModel({
    required this.hospitals,
    required this.articles,
    required this.activities,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      hospitals: List<HospitalModel>.from(
        json['Hospitals'].map(
          (x) => HospitalModel.fromJson(x),
        ),
      ),
      articles: List<ArticleModel>.from(
        json['Articles'].map(
          (x) => ArticleModel.fromJson(x),
        ),
      ),
      activities: List<ActivityModel>.from(
        json['Activities'].map(
          (x) => ActivityModel.fromJson(x),
        ),
      ),
    );
  }
}
