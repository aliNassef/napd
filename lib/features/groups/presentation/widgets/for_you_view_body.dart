import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/utils/app_images.dart';
import 'package:napd/core/widgets/custom_failure_widget.dart';
import 'package:napd/features/groups/presentation/cubits/get_top_for_you_cubit/get_top_for_you_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/app_strings.dart';
import '../../data/model/article_model.dart';
import '../../data/model/podcast_model.dart';
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
          BlocBuilder<GetTopForYouCubit, GetTopForYouState>(
            buildWhen: (previous, current) =>
                current is GetTopForYouArticlesLoaded ||
                current is GetTopForYouArticlesLoading ||
                current is GetTopForYouArticlesFailure,
            builder: (context, state) {
              if (state is GetTopForYouArticlesLoaded) {
                return SliverGrid.builder(
                  itemCount: state.articles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.25,
                    crossAxisSpacing: 25.w,
                    mainAxisSpacing: 30.h,
                    mainAxisExtent: 133.h,
                  ),
                  itemBuilder: (_, index) => ArticleItem(
                    article: state.articles[index],
                  ),
                );
              }
              if (state is GetTopForYouArticlesFailure) {
                return SliverToBoxAdapter(
                  child: CustomFailureWidget(errMessage: state.errorMessage),
                );
              }
              if (state is GetTopForYouArticlesLoading) {
                return SliverGrid.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.25,
                    crossAxisSpacing: 25.w,
                    mainAxisSpacing: 30.h,
                    mainAxisExtent: 133.h,
                  ),
                  itemBuilder: (_, index) => Skeletonizer(
                    enabled: true,
                    child: ArticleItem(
                      article: ArticleModel(
                        imageUrl:
                            'https://th.bing.com/th/id/OIP.IE-ZggnvOgg9FWHsedUbMAHaFj?rs=1&pid=ImgDetMain&cb=idpwebp2&o=7&rm=3',
                        title: 'asss  sd ',
                        createdAt: '',
                        description: 'asd saf ',
                        views: 0,
                      ),
                    ),
                  ),
                );
              }

              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
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
          BlocBuilder<GetTopForYouCubit, GetTopForYouState>(
            buildWhen: (previous, current) =>
                current is GetTopForYouVideosLoaded ||
                current is GetTopForYouVideosLoading ||
                current is GetTopForYouVideosFailure,
            builder: (context, state) {
              if (state is GetTopForYouVideosLoaded) {
                List<String> images = [
                  AppImages.dummyImage1,
                  AppImages.dummyImage2,
                  AppImages.dummyImage3,
                  AppImages.dummyImage4,
                ];
                return SliverGrid.builder(
                  itemCount: state.videos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.25,
                    crossAxisSpacing: 25.w,
                    mainAxisSpacing: 30.h,
                    mainAxisExtent: 133.h,
                  ),
                  itemBuilder: (_, index) => VideoItem(
                    image: images[index],
                    video: VideoModel(
                      url: state.videos[index].url,
                      title: state.videos[index].title,
                      description: state.videos[index].description,
                    ),
                  ),
                );
              }
              if (state is GetTopForYouVideosLoading) {
                return SliverGrid.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.25,
                    crossAxisSpacing: 25.w,
                    mainAxisSpacing: 30.h,
                    mainAxisExtent: 133.h,
                  ),
                  itemBuilder: (_, index) => Skeletonizer(
                    enabled: true,
                    child: VideoItem(
                      video: VideoModel(
                        url: '',
                        title: 'Video Title',
                        description: 'Video Description',
                      ),
                    ),
                  ),
                );
              }
              if (state is GetTopForYouVideosFailure) {
                return SliverToBoxAdapter(
                  child: CustomFailureWidget(errMessage: state.errorMessage),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
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
          BlocBuilder<GetTopForYouCubit, GetTopForYouState>(
            buildWhen: (previous, current) =>
                current is GetTopForYouPodcastsLoaded ||
                current is GetTopForYouPodcastsLoading ||
                current is GetTopForYouPodcastsFailure,
            builder: (context, state) {
              if (state is GetTopForYouPodcastsLoaded) {
                List<String> images = [
                  AppImages.dummyImage1,
                  AppImages.dummyImage2,
                  AppImages.dummyImage3,
                  AppImages.dummyImage4,
                ];
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200.h,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      separatorBuilder: (_, index) => HorizantalSpace(16),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.podcasts.length,
                      itemBuilder: (_, index) => PodcastItem(
                        image: images[index],
                        audio: state.podcasts[index],
                      ),
                    ),
                  ),
                );
              }
              if (state is GetTopForYouPodcastsLoading) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200.h,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      separatorBuilder: (_, index) => HorizantalSpace(16),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) => PodcastItem(
                        audio: PodcastModel(
                          title: 'the mother wise',
                          type: 'audio',
                          duration: '26:45',
                          url:
                              'https://r2.starryai.com/results/1042152870/6eb099de-74c0-460b-900e-551a3e7c540f.webp',
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (state is GetTopForYouPodcastsFailure) {
                return SliverToBoxAdapter(
                  child: CustomFailureWidget(errMessage: state.errorMessage),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          ),
          SliverToBoxAdapter(
            child: VerticalSpace(10),
          ),
        ],
      ),
    );
  }
}
