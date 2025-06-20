import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/features/baby/presentation/cubit/get_baby_cubit/get_baby_cubit.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/widgets/custom_failure_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/widgets/spacers.dart';

class BabyInfoBlocBuilder extends StatelessWidget {
  const BabyInfoBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBabyCubit, GetBabyState>(
      buildWhen: (previous, current) =>
          current is GetBabyFailure ||
          current is GetBabyLoading ||
          current is GetBabyLoaded,
      builder: (context, state) {
        if (state is GetBabyLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.baby.babyName!,
                style: AppStyles.roboto24SemiBold.copyWith(
                  color: AppColors.darkBlueColor,
                ),
              ).withHorizontalPadding(16),
              VerticalSpace(6),
              Text(
                calculateAgeDifference(state.baby.birthDate!),
                style: AppStyles.roboto16Regular.copyWith(
                  color: AppColors.greenLightColor,
                ),
              ).withHorizontalPadding(16),
            ],
          );
        } else if (state is GetBabyLoading) {
          return Skeletonizer(
              enabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ali nassef',
                    style: AppStyles.roboto24SemiBold.copyWith(
                      color: AppColors.darkBlueColor,
                    ),
                  ).withHorizontalPadding(16),
                  VerticalSpace(6),
                  Text(
                    '12 months',
                    style: AppStyles.roboto16Regular.copyWith(
                      color: AppColors.greenLightColor,
                    ),
                  ).withHorizontalPadding(16),
                ],
              ));
        } else if (state is GetBabyFailure) {
          return CustomFailureWidget(errMessage: state.errorMessage);
        }
        return const SizedBox.shrink();
      },
    );
  }

  String calculateAgeDifference(String targetDate) {
    if (targetDate.isEmpty) {
      return '';
    }
    // Parse the target date
    final target = DateTime.parse(targetDate.split('/').reversed.join('-'));
    final now = DateTime.now();

    // Calculate the difference in years and months
    int years = now.year - target.year;
    int months = now.month - target.month;

    // Adjust if the current month is earlier than the target month
    if (months < 0) {
      years -= 1;
      months += 12;
    }
    return tr(
      'age_difference',
      namedArgs: {
        'years': years.toString(),
        'months': months.toString(),
      },
    );
  }
}
