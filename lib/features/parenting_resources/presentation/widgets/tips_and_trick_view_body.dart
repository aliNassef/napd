import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../../../core/widgets/spacers.dart';
import '../../data/models/tips_trics_model.dart';
import '../cubits/tips_and_trics_cubit/tips_and_trics_cubit.dart';
import 'tip_item.dart';

class TipsAndTricksViewBody extends StatelessWidget {
  const TipsAndTricksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TipsAndTricsCubit, TipsAndTricsState>(
      buildWhen: (previous, current) =>
          current is TipsAndTricsLoaded ||
          current is TipsAndTricsFailure ||
          current is TipsAndTricsLoading, 
      builder: (context, state) {
        if (state is TipsAndTricsLoading) {
          return Skeletonizer(
            enabled: true,
            child: _buildLoadingTipsAndTricks(),
          );
        }
        if (state is TipsAndTricsLoaded) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            itemCount: state.tipsAndTricks.length,
            itemBuilder: (context, index) {
              return TipItem(
                index: index,
                tipsAndTricksModel: state.tipsAndTricks[index]);
            },
            separatorBuilder: (context, index) {
              return VerticalSpace(28);
            },
          );
        }
        if (state is TipsAndTricsFailure) {
          return CustomFailureWidget(errMessage: state.errorMessage);
        }
        return const SizedBox.shrink();
      },
    );
  }

  ListView _buildLoadingTipsAndTricks() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      itemCount: 6,
      itemBuilder: (context, index) {
        return TipItem(
          index: index,
          tipsAndTricksModel: TipsAndTricksModel(
            title: "Baby Sleep Tips",
            imagePath:
                "http://graduation-project-version1.runasp.net/TipsAndTricks/baby sleep.png",
            tips: [
              Tip(
                title: "Create a Sleep Routine",
                points: [
                  TipPoint(
                      description:
                          "Put your baby to sleep at the same time daily."),
                  TipPoint(
                      description:
                          "Use calming activities like reading or lullabies.")
                ],
              ),
              Tip(
                title: "Set the Environment",
                points: [
                  TipPoint(description: "Keep the room dark and quiet."),
                  TipPoint(description: "Maintain a comfortable temperature.")
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return VerticalSpace(28);
      },
    );
  }
}
