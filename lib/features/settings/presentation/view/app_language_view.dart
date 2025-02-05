import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/di/service_locator.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/widgets/spacers.dart';
import '../../../../core/utils/app_localizations.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/language_item.dart';

class AppLanguageView extends StatefulWidget {
  const AppLanguageView({super.key});
  static const String routeName = 'app-language';
  @override
  State<AppLanguageView> createState() => _AppLanguageViewState();
}

class _AppLanguageViewState extends State<AppLanguageView> {
  @override
  Widget build(BuildContext context) {
    int appLang =
        injector<AppLocalizations>().getLocaleName(context.locale) == 'ar'
            ? 1
            : 0;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'applanguage'.tr(),
      ),
      body: Column(
        spacing: 30.h,
        children: [
          VerticalSpace(30),
          LanguageItem(
            lang: 'english'.tr(),
            isActive: appLang == 0,
            onTap: () {
              setState(() {
                appLang = 0;
                changeAppLanguage(context);
              });
            },
          ),
          LanguageItem(
            lang: 'arabic'.tr(),
            isActive: appLang == 1,
            onTap: () {
              setState(() {
                appLang = 0;
                changeAppLanguage(context);
              });
            },
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
