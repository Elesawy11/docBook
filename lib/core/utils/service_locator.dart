import 'package:dio/dio.dart';
import 'package:doc_book/features/login/data/source/login_source.dart';
import 'package:doc_book/features/signup/data/source/signup_source.dart';
import 'package:doc_book/features/signup/presentation/manger/sign_up_cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/login/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/signup/data/repo/sign_up_repo.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  Dio dio = DioFactory.getDio();
  //TODO will delete it
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // login feature
  getIt.registerLazySingleton(() => LoginSource(dio));
  getIt.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl(getIt.get()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get()));
  // signup feature
  getIt.registerLazySingleton<SignupSource>(() => SignupSource(dio));
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt.get()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt.get()));
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(getIt.get<ApiService>()),
  );

  getIt.registerLazySingleton<DoctorCubit>(
    () => DoctorCubit(getIt.get<HomeRepo>())..getAllDoctor(),
  );
}
