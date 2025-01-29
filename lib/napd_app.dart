import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_router.dart';
import 'core/utils/app_themes.dart';
import 'features/splash/presentation/view/splash_view.dart';

class Napd extends StatelessWidget {
  const Napd({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      enableScaleWH: () => false,
      enableScaleText: () => false,
      splitScreenMode: true,
      builder: (context, child) => Builder(
        builder: (context) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Napd',
            // locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: getLightTheme(),
            onGenerateRoute: onGenerateRoute,
            initialRoute: SplashView.routeName,
          );
        },
      ),
    );
  }
}
