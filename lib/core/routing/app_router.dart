import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/di/dependency_injection.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/features/home/logic/cubit/tasks_cubit.dart';
import 'package:tasky/features/home/ui/screens/qr_view_screen.dart';
import 'package:tasky/features/login/logic/cubit/login_cubit.dart';
import 'package:tasky/features/home/ui/screens/home_screen.dart';
import 'package:tasky/features/login/ui/screens/login_screen.dart';
import 'package:tasky/features/new_task/logic/add_cubit/new_task_cubit.dart';
import 'package:tasky/features/new_task/logic/edit_cubit/edit_task_cubit.dart';
import 'package:tasky/features/new_task/ui/screens/new_task_screen.dart';
import 'package:tasky/features/profile/logic/cubit/profile_cubit.dart';
import 'package:tasky/features/profile/ui/screen/profile_screen.dart';
import 'package:tasky/features/signup/ui/screens/sign_up_screen.dart';
import 'package:tasky/features/task_details/logic/cubit/task_details_cubit.dart';
import 'package:tasky/features/task_details/ui/screens/task_details_screen.dart';
import '../../features/new_task/ui/screens/edit_task_screen.dart';
import '../../features/on_boarding/on_boarding_screen.dart';
import '../../features/signup/logic/cubit/sign_up_cubit.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => LoginCubit(getIt()),
            child: const LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => SignUpCubit(getIt()),
            child: const SignUpScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => TasksCubit(getIt())..getTasks(),
            child: const HomeScreen(),
          ),
        );
      case Routes.qrViewScreen:
        return MaterialPageRoute(
          builder: (_) => const QrViewScreen(),
        );
      case Routes.taskDetailsScreen:
        final String taskId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                TaskDetailsCubit(getIt(), taskId)..getTaskDetails(),
            child: const TaskDetailsScreen(),
          ),
        );
      case Routes.newTaskScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => NewTaskCubit(getIt()),
            child: const NewTaskScreen(),
          ),
        );
      case Routes.editTaskScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => EditTaskCubit(
              getIt(),
              arguments['taskId'],
              arguments['title'],
              arguments['desc'],
              arguments['priority'],
              arguments['status'],
            ),
            child: const EditTaskScreen(),
          ),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                ProfileCubit(getIt())..getProfileData(),
            child: const ProfileScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
