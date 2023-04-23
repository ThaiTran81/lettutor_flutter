import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lettutor_flutter/data/network/apis/authentication/auth_api.dart';
import 'package:lettutor_flutter/data/network/dio_client.dart';
import 'package:lettutor_flutter/data/repository/user_repository.dart';
import 'package:lettutor_flutter/di/module/network_module.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // singletons:----------------------------------------------------------------
  getIt.registerSingleton<Dio>(NetworkModule.provideDio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(AuthApi(getIt<DioClient>()));

  // repository
  getIt.registerSingleton(UserRepository(getIt<AuthApi>()));
}
