import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/app_intialization.dart';
import 'core/di/service_locator.dart';
import 'core/utils/app_localizations.dart';
import 'napd_app.dart';

void main() async {
  await AppIntialization.initializer();
  final startLocale = await injector<AppLocalizations>().findSystemLocale();
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
