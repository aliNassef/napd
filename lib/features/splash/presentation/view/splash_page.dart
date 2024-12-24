import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/background_widget.dart';
import '../../../layout/presentation/view/layout_view.dart';
import '../widgets/splash_animation_widget.dart';

import '../../../../core/utils/app_images.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 4), _execuateNav);
  }

  void _execuateNav() {
    Navigator.pushReplacementNamed(context, LayoutView.routeName);
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
