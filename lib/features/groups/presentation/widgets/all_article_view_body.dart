import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/functions/toast_dialog.dart';
import 'package:napd/features/groups/data/model/article_model.dart';
import 'package:napd/features/groups/presentation/cubits/article_bloc/article_search_bloc.dart';
import 'package:napd/features/groups/presentation/cubits/article_cubit/article_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/custom_failure_widget.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../core/widgets/spacers.dart';
import '../view/article_details_view.dart';
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
          return Skeletonizer(
            enabled: true,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: CustomSearchBar(
                      onChanged: (value) {},
                    ),
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
            ),
          );
        }
        if (state is ArticleFailure) {
          return CustomFailureWidget(
            errMessage: 'No articles found',
          );
        }
        if (state is ArticleLoaded) {
          final articles = state.articles;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: CustomSearchBar(
                    onChanged: (value) {
                      context.read<ArticleSearchBloc>().add(
                            ArticleOnSearchEvent(query: value),
                          );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(child: VerticalSpace(10)),
              BlocBuilder<ArticleSearchBloc, ArticleSearchState>(
                buildWhen: (previous, current) =>
                    current is ArticleSearchLoading ||
                    current is ArticleSearchLoaded ||
                    current is ArticleSearchFailure,
                builder: (context, state) {
                  if (state is ArticleSearchLoading) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is ArticleSearchFailure) {
                    showToast(text: state.errMessage);
                    return SliverList.separated(
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ArticleDetailsView.routeName,
                            arguments: articles[index],
                          );
                        },
                        child: AllArticleItem(
                          articleModel: articles[index],
                        ),
                      ),
                      separatorBuilder: (_, index) => VerticalSpace(12),
                      itemCount: articles.length,
                    );
                  }

                  if (state is ArticleSearchLoaded) {
                    if (state.articles.isEmpty) {
                      final articles = state.articles;
                      return SliverList.separated(
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ArticleDetailsView.routeName,
                              arguments: articles[index],
                            );
                          },
                          child: AllArticleItem(
                            articleModel: articles[index],
                          ),
                        ),
                        separatorBuilder: (_, index) => VerticalSpace(12),
                        itemCount: articles.length,
                      );
                    }
                    return SliverList.separated(
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ArticleDetailsView.routeName,
                            arguments: articles[index],
                          );
                        },
                        child: AllArticleItem(
                          articleModel: articles[index],
                        ),
                      ),
                      separatorBuilder: (_, index) => VerticalSpace(12),
                      itemCount: articles.length,
                    );
                  }
                  return SliverList.separated(
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ArticleDetailsView.routeName,
                          arguments: articles[index],
                        );
                      },
                      child: AllArticleItem(
                        articleModel: articles[index],
                      ),
                    ),
                    separatorBuilder: (_, index) => VerticalSpace(12),
                    itemCount: articles.length,
                  );
                },
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
