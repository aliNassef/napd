import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/cubit/cubit/app_localization_cubit.dart';
import '../../../../core/extensions/language_code_extension.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/language_item.dart';

class AppLanguageView extends StatelessWidget {
  const AppLanguageView({super.key});
  static const String routeName = 'app-language';
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppLocalizationCubit>();
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.appLanguage,
      ),
      body: Column(
        spacing: 30.h,
        children: [
          VerticalSpace(30),
          LanguageItem(
            lang: AppStrings.english,
            isActive:
                cubit.getAppLanguage(context) == LanguageCode.english.value,
            onTap: () =>
                _changeAppLanguage(context, Locale(LanguageCode.english.value)),
          ),
          LanguageItem(
            lang: AppStrings.arabic,
            isActive:
                cubit.getAppLanguage(context) == LanguageCode.arabic.value,
            onTap: () =>
                _changeAppLanguage(context, Locale(LanguageCode.arabic.value)),
          ),
        ],
      ).withHorizontalPadding(16),
    );
  }

  void _changeAppLanguage(BuildContext context, Locale locale) async {
    await context.read<AppLocalizationCubit>().changeAppLanguage(
          context,
          locale,
        );
  }
}
