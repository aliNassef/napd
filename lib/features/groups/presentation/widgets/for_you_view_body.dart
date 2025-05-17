import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_strings.dart';
import '../../data/model/video_model.dart';
import '../view/all_articles_view.dart';
import '../view/all_videos_view.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/widgets/spacers.dart';
import '../view/podcasts_view.dart';
import 'article_item.dart';
import 'header_with_see_all.dart';
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
                HeaderWithSeeAll(
                  title: AppStrings.articles,
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(AllArticlesView.routeName);
                  },
                ),
                VerticalSpace(30),
              ],
            ).withHorizontalPadding(16),
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
                HeaderWithSeeAll(
                  title: AppStrings.videos,
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(AllVideosView.routeName);
                  },
                ),
                VerticalSpace(30),
              ],
            ).withHorizontalPadding(16),
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
            itemBuilder: (_, index) => VideoItem(
              video: VideoModel(
                url: '',
                title: 'Video Title',
                description: 'Video Description',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(30),
                HeaderWithSeeAll(
                  title: AppStrings.podcasts,
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(PodcastsView.routeName);
                  },
                ),
                VerticalSpace(30),
              ],
            ).withHorizontalPadding(16),
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
