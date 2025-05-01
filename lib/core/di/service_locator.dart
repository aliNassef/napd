import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:napd/features/baby/data/source/baby_remote_datasource.dart';
import 'package:napd/features/parenting_resources/presentation/cubits/activity_cubit/activity_cubit.dart';
import '../../features/baby/data/repo/baby_repo.dart';
import '../../features/baby/data/repo/baby_repo_impl.dart';
import '../../features/baby/data/source/baby_local_datasource.dart';
import '../../features/baby/presentation/cubit/get_cubit/get_baby_cubit.dart';
import '../../features/groups/data/repo/group_repo.dart';
import '../../features/groups/data/repo/group_repo_impl.dart';
import '../../features/groups/data/source/group_remote_source.dart';
import '../../features/groups/presentation/cubits/article_cubit/article_cubit.dart';
import '../../features/parenting_resources/data/repo/parent_recource_repo.dart';
import '../../features/parenting_resources/data/repo/parent_recource_repo_impl.dart';
import '../../features/parenting_resources/data/source/parent_resource_remote_datasource.dart';
import '../../features/parenting_resources/presentation/cubits/recipe_cubit/recipe_cubit.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../features/profile/data/repo/profile_repo_impl.dart';
import '../../features/profile/data/source/profile_local_source.dart';
import '../../features/profile/data/source/profile_remote_source.dart';
import '../controller/cubit/get_mother_cubit/get_mother_profile_cubit.dart';
import '../../features/signup/data/sources/signup_local_data_source.dart';
import '../controller/cubit/app_localization_cubit.dart';
import '../helpers/firebase_auth_service.dart';
import '../helpers/notification_service.dart';
import '../../features/login/data/source/login_local_data_source.dart';
import '../../features/nursery/presentation/cubit/nursing_cubit.dart';
import '../../features/nursery/data/repo/nursing_repo.dart';
import '../../features/nursery/data/repo/nursing_repo_impl.dart';
import '../../features/nursery/data/source/nursing_remote_datasource.dart';
import '../../features/reminder/data/repo/reminder_repo.dart';
import '../../features/reminder/data/repo/reminder_repo_impl.dart';
import '../../features/reminder/data/source/reminder_local_datasource.dart';
import '../../features/reminder/presentation/cubits/reminder_cubit.dart';
import '../../features/signup/data/repo/signup_repo.dart';
import '../cache/cache_helper.dart';
import '../repo/network_info.dart';
import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';
import '../../features/login/data/repo/login_repo_impl.dart';
import '../../features/login/data/source/login_remote_source.dart';
import '../../features/login/data/repo/login_repo.dart';
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
  _setupReminderFeature();
  _parentResourceFeature();
  _babyFeature();
  _groupFeature();
  _profileFeature();
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
    () => SignupRemoteSourceImpl(
      injector<ApiConsumer>(),
    ),
  );
  injector.registerLazySingleton<SignupRepo>(
    () => SignupRepoImpl(
      signupRemoteSource: injector<SignupRemoteSource>(),
      signupLocalDataSource: injector<SignupLocalDataSource>(),
    ),
  );
  injector.registerLazySingleton<SignupLocalDataSource>(
    () => SignupLocalDataSourceImpl(
      cacheHelper: CacheHelper(),
    ),
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

void _setupReminderFeature() {
  injector.registerFactory<ReminderCubit>(
    () => ReminderCubit(reminderRepo: injector<ReminderRepo>()),
  );
  injector.registerLazySingleton<ReminderRepo>(
    () => ReminderRepoImpl(
      localDatasource: injector<ReminderLocalDatasource>(),
    ),
  );

  injector.registerLazySingleton<ReminderLocalDatasource>(
    () => ReminderLocalDatasourceImpl(
      cacheHelper: CacheHelper(),
      notificationService: NotificationService(),
    ),
  );
}

void _parentResourceFeature() {
  injector.registerFactory<RecipeCubit>(
    () => RecipeCubit(injector<ParentRecourceRepo>()),
  );
  injector.registerFactory<ActivityCubit>(
    () => ActivityCubit(injector<ParentRecourceRepo>()),
  );
  injector.registerLazySingleton<ParentRecourceRepo>(
    () => ParentRecourceRepoImpl(
      parentResourceDataSource: injector<ParentResourceRemoteDataSource>(),
    ),
  );
  injector.registerLazySingleton<ParentResourceRemoteDataSource>(
    () => ParentResourceRemoteDataSourceImpl(
      api: injector<ApiConsumer>(),
    ),
  );
}

void _babyFeature() {
  injector.registerFactory<GetBabyCubit>(
    () => GetBabyCubit(injector<BabyRepo>()),
  );
  injector.registerLazySingleton<BabyRepo>(
    () => BabyRepoImpl(
      remoteDatasource: injector<BabyRemoteDatasource>(),
    ),
  );
  injector.registerLazySingleton<BabyLocalDatasource>(
    () => BabyLocalDatasourceImpl(),
  );
  injector.registerLazySingleton<BabyRemoteDatasource>(
    () => BabyRemoteDatasourceImpl(
      apiConsumer: injector<ApiConsumer>(),
      cacheHelper: CacheHelper(),
    ),
  );
}

void _groupFeature() {
  injector.registerFactory<ArticleCubit>(
    () => ArticleCubit(injector<GroupRepo>()),
  );
  injector.registerLazySingleton<GroupRepo>(
    () => GroupRepoImpl(
      remoteSource: injector<GroupRemoteSource>(),
    ),
  );
  injector.registerLazySingleton<GroupRemoteSource>(
    () => GroupRemoteSourceImpl(
      api: injector<ApiConsumer>(),
    ),
  );
}

void _profileFeature() {
  injector.registerFactory<GetMotherProfileCubit>(
    () => GetMotherProfileCubit(injector<ProfileRepo>()),
  );
  injector.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      profileLocalSource: injector<ProfileLocalSource>(),
      profileRemoteSource: injector<ProfileRemoteSource>(),
    ),
  );
  injector.registerLazySingleton<ProfileRemoteSource>(
    () => ProfileRemoteSourceImpl(
      apiConsumer: injector<ApiConsumer>(),
    ),
  );
  injector.registerLazySingleton<ProfileLocalSource>(
    () => ProfileLocalSourceImpl(
      cacheHelper: CacheHelper(),
    ),
  );
}
