import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../view/start_view.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, StartView.routeName);
        },
        child: Text(
          'Skip',
          style: AppStyles.textStyle24R.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}