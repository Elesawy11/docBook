import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/login/presentation/manager/login_cubit/login_cubit.dart';
import '../../features/signup/data/repo/sign_up_repo.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  Dio dio = DioFactory.getDio();
  
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepo(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(getIt.get<ApiService>()),
  );

  getIt.registerLazySingleton<LoginCubit>(
    () => LoginCubit(getIt.get<LoginRepo>()),
  );

  getIt.registerLazySingleton<DoctorCubit>(
    () => DoctorCubit(getIt.get<HomeRepo>())..getAllDoctor(),
  );
}
