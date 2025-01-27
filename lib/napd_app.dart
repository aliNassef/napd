import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
import 'package:napd/features/baby_result/presentation/view/baby_result_screen.dart';
import 'package:napd/features/cry_translator/presentation/view/cry_translator_screen.dart';
import 'core/utils/app_themes.dart';
import 'core/utils/app_router.dart';
=======

import 'core/utils/app_router.dart';
import 'core/utils/app_themes.dart';
import 'features/splash/presentation/view/splash_view.dart';
>>>>>>> origin/master

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
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Napd',
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: getLightTheme(),
        onGenerateRoute: onGenerateRoute,
        initialRoute: CryTranslatorScreen.routeName,
      ),
    );
  }
}
