import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky/features/home/data/apis/tasks_api_service.dart';
import 'package:tasky/features/home/data/repo/tasks_repo.dart';
import 'package:tasky/features/home/logic/cubit/tasks_cubit.dart';
import 'package:tasky/features/login/data/apis/login_api_service.dart';
import 'package:tasky/features/login/data/repos/login_repo.dart';
import 'package:tasky/features/new_task/data/apis/new_task_api_service.dart';
import 'package:tasky/features/new_task/data/repos/new_task_repo.dart';
import 'package:tasky/features/profile/data/apis/profile_api_service.dart';
import 'package:tasky/features/profile/data/repos/profile_repo.dart';
import 'package:tasky/features/signup/data/apis/signup_api_service.dart';
import 'package:tasky/features/task_details/data/apis/task_details_api_service.dart';
import 'package:tasky/features/task_details/data/repos/task_details_repo.dart';
import '../../features/signup/data/repos/signup_repo.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  //login
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  //signup
  getIt.registerLazySingleton<SignupApiService>(() => SignupApiService(dio));
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));

  // home todos
  getIt.registerLazySingleton<TasksApiService>(() => TasksApiService(dio));
  getIt.registerLazySingleton<TasksRepo>(() => TasksRepo(getIt()));
  getIt.registerLazySingleton<TasksCubit>(() => TasksCubit(getIt())); 

  // task details
  getIt.registerLazySingleton<TaskDetailsApiService>(() => TaskDetailsApiService(dio));
  getIt.registerLazySingleton<TaskDetailsRepo>(() => TaskDetailsRepo(getIt()));



  // Add new task
  getIt.registerLazySingleton<NewTaskApiService>(() => NewTaskApiService(dio));
  getIt.registerLazySingleton<NewTaskRepo>(() => NewTaskRepo(getIt()));

  // Profile
  getIt.registerLazySingleton<ProfileApiService>(() => ProfileApiService(dio));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
}
