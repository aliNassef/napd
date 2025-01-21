import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/di/service_locator.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/utils/app_images.dart';
import 'package:napd/core/widgets/spacers.dart';
import '../../../../core/utils/app_localizations.dart';
import 'settings_item.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 24.h,
        children: [
          VerticalSpace(77 - 24),
          SettingsItem(
            image: AppSvgs.languageIcon,
            title: 'applanguage'.tr(),
            onTap: () {
              changeAppLanguage(context);
            },
          ),
          SettingsItem(
            image: AppSvgs.notificationIcon,
            title: 'soundandnotification'.tr(),
            onTap: () {},
          ),
          SettingsItem(
            image: AppSvgs.helpIcon,
            title: 'helpandsupport'.tr(),
            onTap: () {},
          ),
          SettingsItem(
            image: AppSvgs.privacyIcon,
            title: 'privacyandsecurity'.tr(),
            onTap: () {},
          ),
          SettingsItem(
            image: AppSvgs.languageIcon,
            title: 'reports'.tr(),
            onTap: () {},
          ),
          SettingsItem(
            image: AppSvgs.aboutIcon,
            title: 'about'.tr(),
            onTap: () {},
          ),
        ],
      ).withHorizontalPadding(16),
    );
  }

  void changeAppLanguage(BuildContext context) {
    var localeName =
        injector.get<AppLocalizations>().getLocaleName(context.locale);
    injector.get<AppLocalizations>().changeLocale(
          context,
          Locale(localeName == 'ar' ? 'en' : 'ar'),
        );
  }
}
