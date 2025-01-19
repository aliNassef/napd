import 'dart:developer';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/utils/app_localizations.dart';
import 'core/cache/cache_helper.dart';
import 'core/di/service_locator.dart';
import 'core/widgets/custom_bloc_observer.dart';
import 'napd_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized(); // Initialize EasyLocalization
  await setupServiceLocator();
  await CacheHelper.init();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = CustomBlocObserver();
  final startLocale = await injector<AppLocalizations>().findSystemLocale();
  log(startLocale.toString());
  bool useDevicePreview = true;
  if (useDevicePreview) {
    runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => EasyLocalization(
          startLocale: startLocale,
          path: 'assets/translations',
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
          fallbackLocale: Locale('en'), // Fallback locale
          child: const Napd(),
        ),
      ),
    );
  }
  //  else {
  //   runApp(EasyLocalization(
  //     path: 'assets/translations',
  //     supportedLocales: [Locale('en'), Locale('ar')],
  //     fallbackLocale: Locale('en'), // Fallback locale
  //     child: Napd(),
  //   ));
  // }
}
