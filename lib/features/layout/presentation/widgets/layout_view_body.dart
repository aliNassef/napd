import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:napd/features/nursery/presentation/view/nursery_view.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class LayoutViewBody extends StatefulWidget {
  const LayoutViewBody({super.key});

  @override
  State<LayoutViewBody> createState() => _LayoutViewBodyState();
}

class _LayoutViewBodyState extends State<LayoutViewBody> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      Container(
        color: Colors.white,
      ),
      NurseryView(),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.lightBlue,
      ),
      Container(
        color: Colors.blueGrey,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        iconSize: 40,
        icon: SvgPicture.asset(
          AppSvgs.homeIcon,
          colorFilter:
              ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),
        ),
        inactiveIcon: SvgPicture.asset(
          AppSvgs.homeIcon,
          colorFilter:
              ColorFilter.mode(AppColors.darkBlueColor, BlendMode.srcIn),
        ),
      ),
      PersistentBottomNavBarItem(
        iconSize: 40,
        icon: SvgPicture.asset(
          AppSvgs.nurseIcon,
          colorFilter:
              ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),
        ),
        inactiveIcon: SvgPicture.asset(
          AppSvgs.nurseIcon,
          colorFilter:
              ColorFilter.mode(AppColors.darkBlueColor, BlendMode.srcIn),
        ),
      ),
      PersistentBottomNavBarItem(
        iconSize: 40,
        icon: SvgPicture.asset(
          AppSvgs.reminderIcon,
          colorFilter:
              ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),
        ),
        inactiveIcon: SvgPicture.asset(
          AppSvgs.reminderIcon,
          colorFilter:
              ColorFilter.mode(AppColors.darkBlueColor, BlendMode.srcIn),
        ),
      ),
      PersistentBottomNavBarItem(
        iconSize: 40,
        inactiveIcon: SvgPicture.asset(
          AppSvgs.groupIcon,
          colorFilter:
              ColorFilter.mode(AppColors.darkBlueColor, BlendMode.srcIn),
        ),
        icon: SvgPicture.asset(
          AppSvgs.groupIcon,
          colorFilter:
              ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),
        ),
      ),
      PersistentBottomNavBarItem(
        iconSize: 40,
        icon: SvgPicture.asset(
          AppSvgs.profileIcon,
          colorFilter:
              ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),
        ),
        inactiveIcon: SvgPicture.asset(
          AppSvgs.profileIcon,
          colorFilter:
              ColorFilter.mode(AppColors.darkBlueColor, BlendMode.srcIn),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(), 
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true, // Default is true.
      bottomScreenMargin: kBottomNavigationBarHeight,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
      padding: EdgeInsets.only(top: 16.h),
      backgroundColor: Colors.white,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20),
        border: BorderDirectional(
          top: BorderSide(
            width: 1,
            color: Color(0xff5c6898).withValues(alpha: 0.6),
          ),
        ),
        colorBehindNavBar: Colors.white,
      ),
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          duration: Duration(milliseconds: 200),
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style12,
    );
  }
}
