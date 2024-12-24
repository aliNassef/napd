import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/app_themes.dart';
import 'features/splash/presentation/view/splash_view.dart';
import 'core/utils/app_router.dart';

class Napd extends StatelessWidget {
  const Napd({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(426, 926),
      minTextAdapt: true,
      enableScaleWH: () => false,
      enableScaleText: () => false,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Napd',
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: getLightTheme(),
        onGenerateRoute: onGenerateRoute,
        initialRoute: SplashView.routeName,
      ),
    );
  }
}
