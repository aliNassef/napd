import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cache/cache_helper.dart';
import 'core/di/service_locator.dart';
import 'core/widgets/custom_bloc_observer.dart';
import 'napd_app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await CacheHelper.init();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = CustomBlocObserver();
<<<<<<< HEAD
  bool useDevicePreview = false;
=======
  bool useDevicePreview = true;
>>>>>>> f86411b2e59fd07321348b248a7ea4e53fcbb5c6
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
<<<<<<< HEAD
 // runApp(const Napd());
=======
>>>>>>> f86411b2e59fd07321348b248a7ea4e53fcbb5c6
}
