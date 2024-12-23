import 'dart:async';
import 'package:flutter/material.dart';
import 'package:napd/core/widgets/background_widget.dart';
import 'package:napd/features/add_baby/presentation/view/add_baby_page.dart';
import 'package:napd/features/layout/presentation/view/layout_view.dart';
import 'package:napd/features/splash/presentation/widgets/splash_animation_widget.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, AddBabyPage.routeName);
    });

    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: SplashAnimationWidget(
            duration: const Duration(seconds: 5),
            child: Image.asset(
              'assets/images/Frame 2.png',
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
