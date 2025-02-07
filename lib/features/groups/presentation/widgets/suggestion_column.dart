import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';
import 'suggest_message_button.dart';

class SuggestionColumn extends StatelessWidget {
  const SuggestionColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Explain',
          style: AppStyles.roboto20SemiBold.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        VerticalSpace(18),
        SuggestMessageButton(
          text: 'What is this group about?',
        ),
        VerticalSpace(20.h),
        Text(
          'Write & edit',
          style: AppStyles.roboto20SemiBold.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        VerticalSpace(18),
        SuggestMessageButton(
          text: 'Write a recipe for 5 months baby',
        ),
      ],
    );
  }
}
