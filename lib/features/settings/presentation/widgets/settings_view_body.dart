import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            title: 'applanguage'.tr(),
            onTap: () {
              Navigator.of(context).pushNamed(AppLanguageView.routeName);
            },
          ),
          SettingsItem(
            image: AppSvgs.notificationIcon,
            title: 'soundandnotification'.tr(),
            onTap: () {
              Navigator.of(context).pushNamed(SoundsNotificationView.routeName);
            },
          ),
          SettingsItem(
            image: AppSvgs.helpIcon,
            title: 'helpandsupport'.tr(),
            onTap: () {
              Navigator.of(context).pushNamed(HelpAndSupportView.routeName);
            },
          ),
          SettingsItem(
            image: AppSvgs.privacyIcon,
            title: 'privacyandsecurity'.tr(),
            onTap: () {
              Navigator.of(context).pushNamed(PrivacyAndSecurityView.routeName);
            },
          ),
          SettingsItem(
            image: AppSvgs.aboutIcon,
            title: 'about'.tr(),
            onTap: () {
              Navigator.of(context).pushNamed(AboutView.routeName);
            },
          ),
        ],
      ).withHorizontalPadding(16),
    );
  }
}
