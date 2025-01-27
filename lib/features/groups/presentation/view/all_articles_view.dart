import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/all_article_view_body.dart';

class AllArticlesView extends StatelessWidget {
  const AllArticlesView({super.key});
  static const routeName = 'all-articles';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'articles'.tr(),
      ),
      body: SafeArea(
        child: const AllArticlesViewBody(),
      ),
    );
  }
}
