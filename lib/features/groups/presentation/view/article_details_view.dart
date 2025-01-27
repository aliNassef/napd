import 'package:flutter/material.dart';

import '../widgets/article_details_view_body.dart';

class ArticleDetailsView extends StatelessWidget {
  const ArticleDetailsView({super.key});
  static const String routeName = 'article-details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArticleDetailsViewBody(),
    );
  }
}
