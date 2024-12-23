import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/di/dependency_injection.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/features/new_task/ui/screens/new_task_screen.dart';
import 'package:tasky/features/home/ui/screens/home_screen.dart';
import 'package:tasky/features/login/ui/screens/login_screen.dart';
import 'package:tasky/features/profile/ui/screen/profile_screen.dart';
import 'package:tasky/features/signup/ui/screens/sign_up_screen.dart';
import 'package:tasky/features/task_details/ui/screens/task_details_screen.dart';
import '../../features/on_boarding/on_boarding_screen.dart';
import '../../features/signup/logic/cubit/sign_up_cubit.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signupScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => SignUpCubit(getIt()),
                child: const SignUpScreen(),),);
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.newTaskScreen:
        return MaterialPageRoute(builder: (_) => const NewTaskScreen());
      case Routes.taskDetailsScreen:
        return MaterialPageRoute(builder: (_) => const TaskDetailsScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return null;
    }
  }
}
