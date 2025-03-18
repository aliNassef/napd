import 'package:flutter/material.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/utils/app_strings.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';
import '../view/chat_bot_view.dart';

class ChatBotSection extends StatelessWidget {
  const ChatBotSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            AppStrings.ifYouHaveAnyQuestions,
            style: AppStyles.roboto18SemiBold.copyWith(
              color: AppColors.darkBlueColor,
            ),
            textAlign: TextAlign.center,
          ),
          VerticalSpace(16),
          DefaultAppButton(
            text: AppStrings.getStarted,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pushNamed(
                ChatBotView.routeName,
              );
            },
            radius: 20,
            backgroundColor: AppColors.primaryColor,
            textColor: Colors.white,
          ),
        ],
      ).withAllPadding(16),
    );
  }
}
