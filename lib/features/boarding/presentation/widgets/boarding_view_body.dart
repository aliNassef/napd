import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../domain/entity/boarding_entity.dart';
import 'skip_button.dart';
import '../../../../core/utils/app_colors.dart';
import 'boarding_controllers_button.dart';
import 'page_view_item.dart';

class BoardingViewBody extends StatefulWidget {
  const BoardingViewBody({
    super.key,
  });

  @override
  State<BoardingViewBody> createState() => _BoardingViewBodyState();
}

class _BoardingViewBodyState extends State<BoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
    );
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: const [0.7, 1],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryColor,
            AppColors.secondaryColor,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SkipButton(),
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                itemCount: getBoardingList().length,
                itemBuilder: (_, index) =>
                    PageViewItem(currentPage: currentPage),
              ),
            ),
            BoardingControllersButton(
              currentPage: currentPage,
              pageController: pageController,
            )
          ],
        ),
      ),
    );
  }
}
