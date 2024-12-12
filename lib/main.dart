import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/cache/cache_helper.dart';
import 'core/widgets/custom_bloc_observer.dart';

import 'core/di/dependency_injuction.dart';
import 'napd_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await CacheHelper.init();
  Bloc.observer = CustomBlocObserver();
  runApp(const Napd());
}
