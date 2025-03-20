import 'package:device_preview/device_preview.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/app_router.dart';
import 'core/utils/app_themes.dart';
import 'features/shop/presentation/view/cart_view.dart';
import 'features/splash/presentation/view/splash_view.dart';

class Napd extends StatelessWidget {
  const Napd({super.key});

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
            title: 'Mahd',
            builder: DevicePreview.appBuilder,
            theme: getLightTheme(),
            onGenerateRoute: onGenerateRoute,
            initialRoute: CartView.routeName,
          );
        },
      ),
    );
  }
}
