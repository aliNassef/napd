import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/widgets/custom_failure_widget.dart';
import 'package:napd/features/groups/data/model/video_model.dart';
import 'package:napd/features/groups/presentation/cubits/get_all_videos_cubit/get_all_videos_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'video_item.dart';

class AllVideosViewBody extends StatelessWidget {
  const AllVideosViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllVideosCubit, GetAllVideosState>(
      buildWhen: (previous, current) =>
          current is GetAllVideosLoaded ||
          current is GetAllVideosFailure ||
          current is GetAllVideosLoading,
      builder: (context, state) {
        if (state is GetAllVideosLoading) {
          return Skeletonizer(
            enabled: true,
            child: GridView.builder(
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.25,
                crossAxisSpacing: 25.w,
                mainAxisSpacing: 30.h,
                mainAxisExtent: 133.h,
              ),
              itemBuilder: (_, index) => VideoItem(
                video: VideoModel(
                  title: 'Ali NAssef',
                  description: 'Hello iram  x sackj cklajkj',
                  url: 'aaaaaaaaaaaa',
                ),
              ),
            ),
          );
        }
        if (state is GetAllVideosLoaded) {
          return GridView.builder(
            itemCount: state.videos.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.25,
              crossAxisSpacing: 25.w,
              mainAxisSpacing: 30.h,
              mainAxisExtent: 133.h,
            ),
            itemBuilder: (_, index) => VideoItem(
              video: state.videos[index],
            ),
          );
        }

        if (state is GetAllVideosFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
