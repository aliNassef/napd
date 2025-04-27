import 'package:flutter/material.dart';
import 'package:napd/features/groups/data/model/article_model.dart';

import '../widgets/article_details_view_body.dart';

class ArticleDetailsView extends StatelessWidget {
  final ArticleModel articleModel;
  const ArticleDetailsView({super.key, required this.articleModel});
  static const String routeName = 'article-details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArticleDetailsViewBody(
        articleModel: articleModel,
      ),
    );
  }
}
