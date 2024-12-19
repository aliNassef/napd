import 'package:flutter/material.dart';
import 'package:napd/features/splash/presentation/view/splash_page.dart';

import '../../features/boarding/presentation/view/boarding_view.dart';
import '../../features/boarding/presentation/view/start_view.dart';
import '../../features/layout/presentation/view/layout_view.dart';
import '../../features/login/presentation/view/login_view.dart';
import '../../features/login/presentation/view/select_baby_account_view.dart';
import '../../features/nursery/presentation/view/nursery_view.dart';
import '../../features/reminder/presentation/view/reminder_view.dart';
import '../../features/signup/presentation/view/signup_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashPage(),
      );
    case BoardingView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BoardingView(),
      );
    case StartView.routeName:
      return MaterialPageRoute(
        builder: (context) => const StartView(),
      );
    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
    case SignupView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignupView(),
      );
    case SelectBabyAccountView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SelectBabyAccountView(),
      );
    case LayoutView.routeName:
      return MaterialPageRoute(
        builder: (context) => const LayoutView(),
      );
    case NurseryView.routeName:
      return MaterialPageRoute(
        builder: (context) => const NurseryView(),
      );
    case ReminderView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ReminderView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
