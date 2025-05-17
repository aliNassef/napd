import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/controller/cubit/app_localization_cubit.dart';
import 'core/di/service_locator.dart';
import 'core/utils/app_intialization.dart';
import 'napd_app.dart';

void main() async {
  await AppIntialization.initializer();

  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => BlocProvider(
        create: (context) => injector<AppLocalizationCubit>(),
        child: EasyLocalization(
          path: 'assets/translations',
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
          fallbackLocale: Locale('en'),
          child: const Napd(),
        ),
      ),
    ),
  );
}
