import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:napd/core/cubit/cubit/app_localization_cubit.dart';
import 'package:napd/core/helpers/firebase_auth_service.dart';
import 'package:napd/features/login/data/source/login_local_data_source.dart';
import 'package:napd/features/nursery/presentation/cubit/nursing_cubit.dart';
import '../../features/nursery/data/repo/nursing_repo.dart';
import '../../features/nursery/data/repo/nursing_repo_impl.dart';
import '../../features/nursery/data/source/nursing_remote_datasource.dart';
import '../cache/cache_helper.dart';
import '../repo/network_info.dart';
import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';
import '../../features/login/data/repo/login_repo_impl.dart';
import '../../features/login/data/source/login_remote_source.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/signup/domain/repo/signup_repo.dart';
import '../../features/signup/data/repo/signup_repo_impl.dart';
import '../../features/signup/data/sources/signup_remote_source.dart';
import '../../features/signup/presentation/cubit/sign_up_cubit.dart';
import '../utils/app_localizations.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';

final injector = GetIt.instance;

// features -> cubit -- repo -- data
// core
// external
Future<void> setupServiceLocator() async {
  _setupLoginFeature();
  _setupSignupFeature();
  _setupNursingFeature();
  _setupCoreFeature();
  _setupExernalFeature();
}

void _setupExernalFeature() {
  injector.registerLazySingleton<Dio>(
    () => Dio(),
  );
  injector.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: injector<Dio>()),
  );
  injector.registerLazySingleton<InternetConnection>(
    () => InternetConnection(),
  );
  injector.registerLazySingleton(
    () => FirebaseAuthService(),
  );
}

void _setupCoreFeature() {
  injector.registerFactory(
    () => AppLocalizationCubit(
      injector<AppLocalizations>(),
    ),
  );

  injector.registerLazySingleton<AppLocalizations>(
    () => AppLocalizationsImpl(),
  );
  injector.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: injector<InternetConnection>(),
    ),
  );
}

void _setupSignupFeature() {
  injector.registerFactory<SignupCubit>(
    () => SignupCubit(injector<SignupRepo>()),
  );
  injector.registerLazySingleton<SignupRemoteSource>(
    () => SignupRemoteSourceImpl(),
  );
  injector.registerLazySingleton<SignupRepo>(
    () => SignupRepoImpl(signupRemoteSource: injector<SignupRemoteSource>()),
  );
}

void _setupLoginFeature() {
  injector.registerFactory<LoginCubit>(
    () => LoginCubit(injector<LoginRepo>()),
  );
  injector.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(
      loginRemoteSource: injector<LoginRemoteSource>(),
      loginLocalSource: injector<LoginLocalDataSource>(),
    ),
  );
  injector.registerLazySingleton<LoginRemoteSource>(
    () => LoginRemoteSourceImpl(
      api: injector<ApiConsumer>(),
      firebaseAuthService: injector<FirebaseAuthService>(),
    ),
  );
  injector.registerLazySingleton<LoginLocalDataSource>(
    () => LoginLocalDataSourceImpl(
      cacheHelper: CacheHelper(),
    ),
  );
}

void _setupNursingFeature() {
  injector.registerFactory<NursingCubit>(
    () => NursingCubit(injector<NursingRepo>()),
  );
  injector.registerLazySingleton<NursingRepo>(
    () => NursingRepoImpl(
      nursingRemoteDataSource: injector<NursingRemoteDatasource>(),
    ),
  );
  injector.registerLazySingleton<NursingRemoteDatasource>(
    () => NursingRemoteDatasourceImpl(
      apiConsumer: injector<ApiConsumer>(),
    ),
  );
}
