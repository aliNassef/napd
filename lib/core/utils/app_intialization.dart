import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../firebase_options.dart';
import '../cache/cache_helper.dart';
import '../di/service_locator.dart';
import '../helpers/notification_service.dart';
import '../widgets/custom_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
 class AppIntialization {
  AppIntialization._();
  static Future<void> initializer() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await EasyLocalization.ensureInitialized();
    await setupServiceLocator();
    await CacheHelper.init();
    await ScreenUtil.ensureScreenSize();
    await NotificationService.initialize();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Bloc.observer = CustomBlocObserver();
  }
}
