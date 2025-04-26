import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/di/service_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../cubits/article_cubit/article_cubit.dart';
import '../widgets/all_article_view_body.dart';

class AllArticlesView extends StatelessWidget {
  const AllArticlesView({super.key});
  static const routeName = 'all-articles';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.articles,
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => injector<ArticleCubit>()..getArticles(),
          child: const AllArticlesViewBody(),
        ),
      ),
    );
  }
}
