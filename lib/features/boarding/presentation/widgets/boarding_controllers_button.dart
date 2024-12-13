import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../view/start_view.dart';

class BoardingControllersButton extends StatelessWidget {
  const BoardingControllersButton({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: currentPage != 0,
          child: GestureDetector(
            onTap: () {
              pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            child: Text(
              'Previous',
              style: AppStyles.textStyle24R.copyWith(
                color: Color(0xffeae8e8).withValues(alpha: 0.6),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (currentPage == 2) {
              Navigator.pushNamed(context, StartView.routeName);
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          },
          child: Text(
            'Next',
            style: AppStyles.textStyle24R.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
