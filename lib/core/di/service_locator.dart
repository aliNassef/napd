import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:napd/core/api/api_consumer.dart';
import 'package:napd/core/api/dio_consumer.dart';
import 'package:napd/features/login/data/repo/login_repo_impl.dart';
import 'package:napd/features/login/data/source/login_remote_source.dart';
import 'package:napd/features/login/domain/repo/login_repo.dart';
import '../utils/app_localizations.dart';
import 'package:napd/features/login/presentation/cubit/login_cubit.dart';

final injector = GetIt.instance;

Future<void> setupServiceLocator() async {
  injector.registerLazySingleton<AppLocalizations>(
    () => AppLocalizationsImpl(),
  );
  // api
  injector.registerLazySingleton<Dio>(() => Dio());
  injector.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: injector<Dio>()),
  );

  // login
  injector.registerLazySingleton<LoginRemoteSource>(
    () => LoginRemoteSource(api: injector<ApiConsumer>()),
  );
  injector.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(loginRemoteSource: injector<LoginRemoteSource>()),
  );

  injector.registerFactory<LoginCubit>(
    () => LoginCubit(injector<LoginRepo>()),
  );
}
