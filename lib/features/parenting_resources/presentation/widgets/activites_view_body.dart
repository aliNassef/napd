import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/widgets/custom_failure_widget.dart';
import 'package:napd/features/parenting_resources/data/models/activity_model.dart';
import 'package:napd/features/parenting_resources/presentation/cubits/activity_cubit/activity_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/spacers.dart';
import 'activity_item.dart';

class ActivitesViewBody extends StatelessWidget {
  const ActivitesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityCubit, ActivityState>(
      buildWhen: (previous, current) =>
          current is ActivityLoading ||
          current is ActivityLoaded ||
          current is ActivityFailure,
      builder: (context, state) {
        if (state is ActivityFailure) {
          return CustomFailureWidget(errMessage: state.errorMessage);
        }
        if (state is ActivityLoading) {
          return _buildLoadingActivity();
        }
        if (state is ActivityLoaded) {
          if (state.activities.isEmpty) {
            return const Center(
              child: Text('No Activities Found'),
            );
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            itemBuilder: (_, index) {
              return ActivityItem(activityModel: state.activities[index]);
            },
            separatorBuilder: (_, __) => const VerticalSpace(28),
            itemCount: state.activities.length,
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  Skeletonizer _buildLoadingActivity() {
    var activityModel = ActivityModel(
      title: 'title',
      content: 'description',
      imageUrl: 'imageUrl',
    );
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        itemBuilder: (_, index) {
          return ActivityItem(activityModel: activityModel);
        },
        separatorBuilder: (_, __) => const VerticalSpace(28),
        itemCount: 10,
      ),
    );
  }
}
