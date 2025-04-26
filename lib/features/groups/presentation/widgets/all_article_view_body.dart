import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/features/groups/data/model/article_model.dart';
import 'package:napd/features/groups/presentation/cubits/article_cubit/article_cubit.dart';

import '../../../../core/widgets/custom_failure_widget.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../core/widgets/spacers.dart';
import 'all_article_item.dart';

class AllArticlesViewBody extends StatelessWidget {
  const AllArticlesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticleState>(
      buildWhen: (previous, current) =>
          current is ArticleLoading ||
          current is ArticleLoaded ||
          current is ArticleFailure,
      builder: (context, state) {
        if (state is ArticleLoading) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: CustomSearchBar(),
                ),
              ),
              SliverToBoxAdapter(child: VerticalSpace(10)),
              SliverList.separated(
                itemBuilder: (_, index) => AllArticleItem(
                  articleModel: ArticleModel(
                    createdAt: 'Loading...',
                    description: 'Loading...',
                    title: 'Loading...',
                    imageUrl: 'Loading...',
                    views: 100,
                  ),
                ),
                separatorBuilder: (_, index) => VerticalSpace(12),
                itemCount: 10,
              ),
            ],
          );
        }
        if (state is ArticleFailure) {
          return CustomFailureWidget(
            errMessage: state.errorMessage,
          );
        }
        if (state is ArticleLoaded) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: CustomSearchBar(),
                ),
              ),
              SliverToBoxAdapter(child: VerticalSpace(10)),
              SliverList.separated(
                itemBuilder: (_, index) => AllArticleItem(
                  articleModel: state.articles[index],
                ),
                separatorBuilder: (_, index) => VerticalSpace(12),
                itemCount: state.articles.length,
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
