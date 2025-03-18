import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../repo/network_info.dart';
import '../repo/network_info_impl.dart';
import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';
import '../../features/login/data/repo/login_repo_impl.dart';
import '../../features/login/data/source/login_remote_source.dart';
import '../../features/login/domain/repo/login_repo.dart';
import '../../features/signup/domain/repo/signup_repo.dart';
import '../../features/signup/data/repo/signup_repo_impl.dart';
import '../../features/signup/data/sources/signup_remote_source.dart';
import '../../features/signup/presentation/cubit/sign_up_cubit.dart';
import '../utils/app_localizations.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';

final injector = GetIt.instance;

Future<void> setupServiceLocator() async {
  injector.registerLazySingleton<AppLocalizations>(
    () => AppLocalizationsImpl(),
  );
  injector.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
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
    () => LoginRepoImpl(
      loginRemoteSource: injector<LoginRemoteSource>(),
    ),
  );

  injector.registerFactory<LoginCubit>(
    () => LoginCubit(injector<LoginRepo>()),
  );

  // signup
  injector.registerLazySingleton<SignupRemoteSource>(
    () => SignupRemoteSource(api: injector<ApiConsumer>()),
  );
  injector.registerLazySingleton<SignupRepo>(
    () => SignupRepoImpl(signupRemoteSource: injector<SignupRemoteSource>()),
  );
  injector.registerFactory<SignupCubit>(
    () => SignupCubit(injector<SignupRepo>()),
  );
}
