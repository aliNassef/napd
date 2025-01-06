import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';
import 'article_item.dart';
import 'podcast_item.dart';
import 'video_item.dart';

class ForyouViewBody extends StatelessWidget {
  const ForyouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(30),
                Text(
                  'Articles',
                  style: AppStyles.textStyle24B.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
                VerticalSpace(30),
              ],
            ).withHorizantalPadding(16),
          ),
          SliverGrid.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.25,
              crossAxisSpacing: 25.w,
              mainAxisSpacing: 30.h,
              mainAxisExtent: 133.h,
            ),
            itemBuilder: (_, index) => ArticleItem(),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(30),
                Text(
                  'Videos',
                  style: AppStyles.textStyle24B.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
                VerticalSpace(30),
              ],
            ).withHorizantalPadding(16),
          ),
          SliverGrid.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.25,
              crossAxisSpacing: 25.w,
              mainAxisSpacing: 30.h,
              mainAxisExtent: 133.h,
            ),
            itemBuilder: (_, index) => VideoItem(),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(30),
                Text(
                  'Podcasts',
                  style: AppStyles.textStyle24B.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
                VerticalSpace(30),
              ],
            ).withHorizantalPadding(16),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                separatorBuilder: (_, index) => HorizantalSpace(16),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (_, index) => PodcastItem(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: VerticalSpace(10),
          ),
        ],
      ),
    );
  }
}
