import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lettutor_thaitran81/data/network/apis/general/auth_api.dart';
import 'package:lettutor_thaitran81/data/network/apis/general/course_api.dart';
import 'package:lettutor_thaitran81/data/network/apis/general/schedule_api.dart';
import 'package:lettutor_thaitran81/data/network/apis/general/tutor_api.dart';
import 'package:lettutor_thaitran81/data/network/dio_client.dart';
import 'package:lettutor_thaitran81/data/repository/course_repository.dart';
import 'package:lettutor_thaitran81/data/repository/schedule_repository.dart';
import 'package:lettutor_thaitran81/data/repository/tutor_repository.dart';
import 'package:lettutor_thaitran81/data/repository/user_repository.dart';
import 'package:lettutor_thaitran81/di/module/network_module.dart';
import 'package:lettutor_thaitran81/provider/auth_provider.dart';
import 'package:lettutor_thaitran81/screen/mentor_section/mentors_screen/mentors_screen_provider.dart';

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
