import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entity/boarding_entity.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.currentPage,
  });

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RepaintBoundary(
          child: Image.asset(
            getBoardingList()[currentPage].img,
            height: context.height * .45,
            width: context.width,
          ),
        ),
        VerticalSpace(16),
        DotsIndicator(
          dotsCount: 3,
          position: currentPage,
          decorator: DotsDecorator(
            activeColor: AppColors.secondaryColor,
            size: const Size.fromRadius(11),
            activeSize: const Size.fromRadius(11),
            color: AppColors.greyColor,
          ),
        ),
        VerticalSpace(35),
        Text(
          getBoardingList()[currentPage].title,
          style: AppStyles.textStyle32B.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        VerticalSpace(35),
        Text(
          getBoardingList()[currentPage].subtitle,
          style: AppStyles.textStyle24R.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
