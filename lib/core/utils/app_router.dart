import 'package:flutter/material.dart';
import 'package:napd/features/baby/presentation/view/baby_account_view.dart';
import 'package:napd/features/baby/presentation/view/baby_result_view.dart';
import 'package:napd/features/baby/presentation/view/cry_translator_view.dart';
import 'package:napd/features/recording/presentation/view/record_screen.dart';
import '../../features/baby/presentation/view/add_baby_view.dart';
import '../../features/baby/presentation/view/baby_profile_details_view.dart';
import '../../features/baby/presentation/view/baby_profile_view.dart';
import '../../features/groups/presentation/view/all_articles_view.dart';
import '../../features/groups/presentation/view/all_videos_view.dart';
import '../../features/groups/presentation/view/article_details_view.dart';
import '../../features/groups/presentation/view/podcasts_view.dart';
import '../../features/parenting_resources/presentation/views/activites_view.dart';
import '../../features/parenting_resources/presentation/views/recipes_view.dart';
import '../../features/reminder/presentation/view/set_reminder_view.dart';
import '../../features/settings/presentation/view/settings_view.dart';
import '../../features/shop/presentation/view/shop_view.dart';
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
    case AddBabyView.routeName:
      return MaterialPageRoute(
        builder: (context) => const AddBabyView(),
      );
    case BabyAccountView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BabyAccountView(),
      );
    case CryTranslatorView.routeName:
      return MaterialPageRoute(
        builder: (context) => const CryTranslatorView(),
      );
    case RecordScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const RecordScreen(),
      );
    case BabyResultView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BabyResultView(),
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
    case ShopView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ShopView(),
      );
    case RecipesView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ShopView(),
      );
    case BabyProfileView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BabyProfileView(),
      );
    case BabyProfileDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BabyProfileDetailsView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
