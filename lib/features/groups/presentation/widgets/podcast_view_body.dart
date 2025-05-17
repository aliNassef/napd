import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/widgets/custom_failure_widget.dart';
import 'package:napd/features/groups/data/model/podcast_model.dart';
import 'package:napd/features/groups/presentation/cubits/get_podcasts_cubit/get_podcasts_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/spacers.dart';
import 'podcasts_audio_item.dart';

class PodcastsViewBody extends StatelessWidget {
  const PodcastsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPodcastsCubit, GetPodcastsState>(
      buildWhen: (previous, current) =>
          current is GetPodcastsLoaded ||
          current is GetPodcastsFailure ||
          current is GetPodcastsLoading,
      builder: (context, state) {
        if (state is GetPodcastsLoading) {
          return Skeletonizer(
            enabled: true,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              itemBuilder: (_, index) => PodcastsAudioItem(
                audio: PodcastModel(
                  title: 'the mother wise',
                  type: 'audio',
                  duration: '26:45',
                  url:
                      'https://r2.starryai.com/results/1042152870/6eb099de-74c0-460b-900e-551a3e7c540f.webp',
                ),
              ),
              separatorBuilder: (_, __) => VerticalSpace(12),
              itemCount: 10,
            ),
          );
        }

        if (state is GetPodcastsFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        }
        if (state is GetPodcastsLoaded) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            itemBuilder: (_, index) => PodcastsAudioItem(
              audio: state.podcasts[index],
            ),
            separatorBuilder: (_, __) => VerticalSpace(12),
            itemCount: state.podcasts.length,
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
