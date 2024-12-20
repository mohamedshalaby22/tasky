import 'package:flutter/material.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/features/login/login_screen.dart';
import '../../features/on_boarding/on_boarding_screen.dart';

class AppRouter {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: Center(child: Text('inValid Route'))));
    }
  }
}
