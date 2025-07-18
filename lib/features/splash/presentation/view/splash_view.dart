import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/cache/cache_helper.dart';
import 'package:napd/features/layout/presentation/view/layout_view.dart';
import '../../../boarding/presentation/view/boarding_view.dart';
import '../../../../core/widgets/background_widget.dart';
import '../widgets/splash_animation_widget.dart';

import '../../../../core/utils/app_images.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'splash';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 4), _execuateNav);
  }

  void _execuateNav() {
    final user = CacheHelper().getData(key: ApiKey.token);
    if (user == null) {
      Navigator.pushReplacementNamed(context, BoardingView.routeName);
    } else {
      Navigator.pushReplacementNamed(context, LayoutView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: SplashAnimationWidget(
            duration: const Duration(seconds: 3),
            child: Image.asset(
              AppImages.splash,
              width: 300.w,
              height: 300.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
