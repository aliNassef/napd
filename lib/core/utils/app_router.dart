import 'package:flutter/material.dart';
import 'package:napd/core/models/baby_model.dart';
import '../../features/groups/presentation/view/podcasts_details_view.dart';
import '../../features/home/presentation/view/chat_bot_view.dart';
import '../../features/home/presentation/view/gallery_view.dart';
import '../../features/shop/presentation/view/cart_view.dart';
import '../../features/shop/presentation/view/thanks_view.dart';
import '../../features/shop/presentation/view/product_details_view.dart';
import '../../features/signup/presentation/view/create_baby_account_view.dart';
import '../../features/baby/presentation/view/baby_result_view.dart';
import '../../features/baby/presentation/view/cry_translator_view.dart';
import '../../features/groups/presentation/view/all_groups_view.dart';
import '../../features/groups/presentation/view/group_chat_view.dart';
import '../../features/recording/presentation/view/record_screen.dart';
import '../../features/baby/presentation/view/baby_profile_details_view.dart';
import '../../features/baby/presentation/view/baby_profile_view.dart';
import '../../features/groups/presentation/view/all_articles_view.dart';
import '../../features/groups/presentation/view/all_videos_view.dart';
import '../../features/groups/presentation/view/article_details_view.dart';
import '../../features/groups/presentation/view/podcasts_view.dart';
import '../../features/parenting_resources/presentation/views/activites_view.dart';
import '../../features/parenting_resources/presentation/views/recipes_view.dart';
import '../../features/reminder/presentation/view/set_reminder_view.dart';
import '../../features/settings/presentation/view/about_view.dart';
import '../../features/settings/presentation/view/app_language_view.dart';
import '../../features/settings/presentation/view/help_and_support_view.dart';
import '../../features/settings/presentation/view/privacy_and_security_view.dart';
import '../../features/settings/presentation/view/settings_view.dart';
import '../../features/settings/presentation/view/sounds_notification_view.dart';
import '../../features/shop/presentation/view/shop_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

import '../../features/boarding/presentation/view/boarding_view.dart';
import '../../features/boarding/presentation/view/start_view.dart';
import '../../features/layout/presentation/view/layout_view.dart';
import '../../features/login/presentation/view/login_view.dart';
import '../../features/login/presentation/view/select_baby_account_view.dart';
import '../../features/nursery/presentation/view/nursery_view.dart';
import '../../features/signup/presentation/view/signup_view.dart';
import '../../features/parenting_resources/presentation/views/tips_and_tricks_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );

    case CreateBabyAccountView.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateBabyAccountView(),
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
      final babies = settings.arguments as List<BabyModel>;
      return MaterialPageRoute(
        builder: (context) => SelectBabyAccountView(
          babies: babies,
        ),
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
    case PodcastsDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const PodcastsDetailsView(),
      );
    case ProductDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProductDetailsView(),
      );
    case CartView.routeName:
      return MaterialPageRoute(
        builder: (context) => CartView(),
      );
    case ThanksView.routeName:
      return MaterialPageRoute(
        builder: (context) => ThanksView(),
      );
    case ShopView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ShopView(),
      );
    case RecipesView.routeName:
      return MaterialPageRoute(
        builder: (context) => const RecipesView(),
      );
    case BabyProfileView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BabyProfileView(),
      );
    case BabyProfileDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BabyProfileDetailsView(),
      );
    case AllGroupsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const AllGroupsView(),
      );
    case GroupChatView.routeName:
      return MaterialPageRoute(
        builder: (context) => const GroupChatView(),
      );
    case AppLanguageView.routeName:
      return MaterialPageRoute(
        builder: (context) => const AppLanguageView(),
      );
    case SoundsNotificationView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SoundsNotificationView(),
      );
    case PrivacyAndSecurityView.routeName:
      return MaterialPageRoute(
        builder: (context) => const PrivacyAndSecurityView(),
      );
    case AboutView.routeName:
      return MaterialPageRoute(
        builder: (context) => const AboutView(),
      );
    case HelpAndSupportView.routeName:
      return MaterialPageRoute(
        builder: (context) => const HelpAndSupportView(),
      );
    case GalleryView.routeName:
      return MaterialPageRoute(
        builder: (context) => const GalleryView(),
      );
    case ChatBotView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChatBotView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
