import 'package:flutter/material.dart';
import '../../features/add_baby/presentation/view/add_baby_page.dart';
import '../../features/groups/presentation/view/all_articles_view.dart';
import '../../features/groups/presentation/view/all_videos_view.dart';
import '../../features/groups/presentation/view/article_details_view.dart';
import '../../features/groups/presentation/view/pocasts_view.dart';
import '../../features/parenting_resources/presentation/views/activites_view.dart';
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
    case AllArticlesView.routeName:
      return MaterialPageRoute(
        builder: (context) => const AllArticlesView(),
      );
    case AllVideosView.routeName:
      return MaterialPageRoute(
        builder: (context) => const AllVideosView(),
      );
    case ActivitesView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ActivitesView(),
      );
    case ArticleDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ArticleDetailsView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
