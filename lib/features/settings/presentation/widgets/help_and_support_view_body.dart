import 'package:flutter/material.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/utils/app_styles.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/spacers.dart';

class HelpAndSupportViewBody extends StatelessWidget {
  const HelpAndSupportViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(16),
        Text(
          'How can i help you?',
          style: AppStyles.roboto32Medium.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
      ],
    ).withHorizontalPadding(16);
  }
}
