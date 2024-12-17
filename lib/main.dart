import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/cache/cache_helper.dart';
import 'core/di/service_locator.dart';
import 'core/widgets/custom_bloc_observer.dart';
import 'napd_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await CacheHelper.init();
  Bloc.observer = CustomBlocObserver();
  bool useDevicePreview = true;
  if (useDevicePreview) {
    runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const Napd(),
      ),
    );
  } else {
    runApp(const Napd());
  }
}
