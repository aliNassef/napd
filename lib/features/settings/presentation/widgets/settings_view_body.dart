import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_strings.dart';
import '../view/about_view.dart';
import '../view/app_language_view.dart';
import '../view/help_and_support_view.dart';
import '../view/privacy_and_security_view.dart';
import '../view/sounds_notification_view.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/spacers.dart';
import 'settings_item.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 24.h,
        children: [
          VerticalSpace(60),
          SettingsItem(
            image: AppSvgs.languageIcon,
            title: AppStrings.appLanguage,
            onTap: () {
              Navigator.of(context).pushNamed(AppLanguageView.routeName);
            },
          ),
          SettingsItem(
            image: AppSvgs.notificationIcon,
            title: AppStrings.soundNotifications,
            onTap: () {
              Navigator.of(context).pushNamed(SoundsNotificationView.routeName);
            },
          ),
          SettingsItem(
            image: AppSvgs.helpIcon,
            title: AppStrings.helpAndSupport,
            onTap: () {
              Navigator.of(context).pushNamed(HelpAndSupportView.routeName);
            },
          ),
          SettingsItem(
            image: AppSvgs.privacyIcon,
            title: AppStrings.privacyAndSecurity,
            onTap: () {
              Navigator.of(context).pushNamed(PrivacyAndSecurityView.routeName);
            },
          ),
          SettingsItem(
            image: AppSvgs.aboutIcon,
            title: AppStrings.about,
            onTap: () {
              Navigator.of(context).pushNamed(AboutView.routeName);
            },
          ),
        ],
      ).withHorizontalPadding(16),
    );
  }
}
