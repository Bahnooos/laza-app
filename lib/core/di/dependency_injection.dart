import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:laza_app/core/networking/dio_factory.dart';
import 'package:laza_app/features/home/data/repos/home_repo_impl.dart';
import 'package:laza_app/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:laza_app/features/login/data/repos/login_repo_impl.dart';
import 'package:laza_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:laza_app/features/signup/data/repos/sign_up_repo_impl.dart';
import 'package:laza_app/features/signup/data/repos/verification_repo_impl.dart';
import 'package:laza_app/features/signup/presentation/logic/cubit/verification_cubit.dart';

import '../../features/signup/presentation/logic/cubit/sign_up_cubit.dart';
import '../networking/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // setup dio and api service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // signup
  getIt.registerLazySingleton<SignUpRepoImpl>(() => SignUpRepoImpl(getIt()));
  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(getIt<SignUpRepoImpl>()),
  );

  // Login
  getIt.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepoImpl>()));

  //verification
  getIt.registerLazySingleton<VerificationRepoImpl>(
    () => VerificationRepoImpl(getIt()),
  );
  getIt.registerFactory<VerificationCubit>(
    () => VerificationCubit(getIt<VerificationRepoImpl>()),
  );
  // Home
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(getIt()),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(getIt<HomeRepoImpl>()),
  );
}
