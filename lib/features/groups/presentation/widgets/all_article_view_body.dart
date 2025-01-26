import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../core/widgets/spacers.dart';
import 'all_article_item.dart';

class AllArticlesViewBody extends StatelessWidget {
  const AllArticlesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: CustomSearchBar(),
          ),
        ),
        SliverToBoxAdapter(child: VerticalSpace(10)),
        SliverList.separated(
          itemBuilder: (_, index) => AllArticleItem(),
          separatorBuilder: (_, index) => VerticalSpace(12),
          itemCount: 10,
        ),
      ],
    );
  }
}
