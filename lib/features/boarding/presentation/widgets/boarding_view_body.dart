import 'package:flutter/material.dart';
import '../../domain/entity/boarding_entity.dart';
import 'skip_button.dart';
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
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SkipButton(),
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: getBoardingList().length,
              itemBuilder: (_, index) => PageViewItem(currentPage: currentPage),
            ),
          ),
          BoardingControllersButton(
            currentPage: currentPage,
            pageController: pageController,
          )
        ],
      ),
    );
  }

  @override

  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
