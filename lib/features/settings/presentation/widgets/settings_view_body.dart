import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'settings_item.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.h,
      children: [
        VerticalSpace(77 - 24),
        SettingsItem(
          title: 'App’s language',
          onTap: () {},
        ),
        SettingsItem(
          title: 'Sound and notification',
          onTap: () {},
        ),
        SettingsItem(
          title: 'Help & Support',
          onTap: () {},
        ),
        SettingsItem(
          title: 'Privacy & Security',
          onTap: () {},
        ),
        SettingsItem(
          title: 'Reports',
          onTap: () {},
        ),
        SettingsItem(
          title: 'About',
          onTap: () {},
        ),
      ],
    ).withHorizontalPadding(16);
  }
}
