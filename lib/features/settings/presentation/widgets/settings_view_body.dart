import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/utils/app_images.dart';
import 'package:napd/core/widgets/spacers.dart';
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
            title: 'App’s language',
            onTap: () {},
          ),
          SettingsItem(
            image: AppSvgs.notificationIcon,
            title: 'Sound and notification',
            onTap: () {},
          ),
          SettingsItem(
            image: AppSvgs.helpIcon,
            title: 'Help & Support',
            onTap: () {},
          ),
          SettingsItem(
            image: AppSvgs.privacyIcon,
            title: 'Privacy & Security',
            onTap: () {},
          ),
          SettingsItem(
            image: AppSvgs.languageIcon,
            title: 'Reports',
            onTap: () {},
          ),
          SettingsItem(
            image: AppSvgs.aboutIcon,
            title: 'About',
            onTap: () {},
          ),
        ],
      ).withHorizontalPadding(16),
    );
  }
}
