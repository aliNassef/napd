import 'package:flutter/material.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_strings.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

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
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: ChatBotView(),
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
