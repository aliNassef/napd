import 'package:device_preview/device_preview.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/cubit/cubit/app_localization_cubit.dart';
import 'package:napd/core/di/service_locator.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'core/utils/app_router.dart';
import 'core/utils/app_themes.dart';
import 'features/signup/presentation/view/signup_view.dart';

class Napd extends StatelessWidget {
  const Napd({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<LoginCubit>(),
      child: Material(
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          enableScaleWH: () => false,
          enableScaleText: () => false,
          splitScreenMode: true,
          builder: (context, child) =>
              BlocBuilder<AppLocalizationCubit, AppLocalizationState>(
            buildWhen: (previous, current) =>
                current is AppLocalizationLoading ||
                current is AppLocalizationReset,
            builder: (context, state) {
              var currentLocale = context.locale;
              if (state is AppLocalizationLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: getLightTheme().primaryColor,
                  ),
                );
              }
              return MaterialApp(
                key: ValueKey(currentLocale.toString()),
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: currentLocale,
                debugShowCheckedModeBanner: false,
                title: 'Mahd',
                builder: DevicePreview.appBuilder,
                theme: getLightTheme(),
                onGenerateRoute: onGenerateRoute,
                initialRoute: SignupView.routeName,
              );
            },
          ),
        ),
      ),
    );
  }
}
