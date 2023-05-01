import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lettutor_flutter/data/network/apis/authentication/auth_api.dart';
import 'package:lettutor_flutter/data/network/apis/authentication/course_api.dart';
import 'package:lettutor_flutter/data/network/apis/authentication/schedule_api.dart';
import 'package:lettutor_flutter/data/network/apis/authentication/tutor_api.dart';
import 'package:lettutor_flutter/data/network/dio_client.dart';
import 'package:lettutor_flutter/data/repository/course_repository.dart';
import 'package:lettutor_flutter/data/repository/schedule_repository.dart';
import 'package:lettutor_flutter/data/repository/tutor_repository.dart';
import 'package:lettutor_flutter/data/repository/user_repository.dart';
import 'package:lettutor_flutter/di/module/network_module.dart';
import 'package:lettutor_flutter/provider/auth_provider.dart';
import 'package:lettutor_flutter/screen/mentor_section/mentors_screen/mentors_screen_provider.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // singletons:----------------------------------------------------------------
  getIt.registerSingleton<Dio>(NetworkModule.provideDio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(AuthApi(getIt<DioClient>()));
  getIt.registerSingleton(TutorApi(getIt<DioClient>()));
  getIt.registerSingleton(CourseApi(getIt<DioClient>()));
  getIt.registerSingleton(ScheduleApi(getIt.get<DioClient>()));

  // repository
  getIt.registerSingleton(UserRepository(getIt<AuthApi>()));
  getIt.registerSingleton(TutorRepository(getIt<TutorApi>()));
  getIt.registerSingleton(CourseRepository(getIt<CourseApi>()));
  getIt.registerSingleton(ScheduleRepository(getIt.get<ScheduleApi>()));

  // provider
  getIt.registerSingleton(AuthProvider());
  getIt.registerSingleton(MentorsScreenProvider());
}
