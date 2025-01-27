import 'package:flutter/material.dart';
import 'package:napd/features/baby_account/presentation/view/baby_account_view.dart';
import 'package:napd/features/baby_result/presentation/view/baby_result_screen.dart';
import 'package:napd/features/cry_translator/presentation/view/cry_translator_screen.dart';
import 'package:napd/features/recording/presentation/view/record_screen.dart';
import '../../features/add_baby/presentation/view/add_baby_page.dart';
import '../../features/groups/presentation/view/pocasts_view.dart';
import '../../features/reminder/presentation/view/set_reminder_view.dart';
import '../../features/settings/presentation/view/settings_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

import '../../features/boarding/presentation/view/boarding_view.dart';
import '../../features/boarding/presentation/view/start_view.dart';
import '../../features/layout/presentation/view/layout_view.dart';
import '../../features/login/presentation/view/login_view.dart';
import '../../features/login/presentation/view/select_baby_account_view.dart';
import '../../features/nursery/presentation/view/nursery_view.dart';
import '../../features/reminder/presentation/view/reminder_view.dart';
import '../../features/signup/presentation/view/signup_view.dart';
import '../../features/parenting_resources/presentation/views/tips_and_tricks_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    case AddBabyPage.routeName:
      return MaterialPageRoute(
        builder: (context) => const AddBabyPage(),
      );
    case BabyAccountView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BabyAccountView(),
      );
    case CryTranslatorScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CryTranslatorScreen(),
      );
    case RecordScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const RecordScreen(),
      );
    case BabyResultScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const BabyResultScreen(),
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
    case SettingsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SettingsView(),
      );
    case ReminderView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ReminderView(),
      );
    case TipsAndTricksView.routeName:
      return MaterialPageRoute(
        builder: (context) => const TipsAndTricksView(),
      );
    case SetReminderView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SetReminderView(),
      );
         case PodcastsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const PodcastsView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
  
}
