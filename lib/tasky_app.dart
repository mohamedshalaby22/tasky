import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/constants/app_constants.dart';
import 'package:tasky/core/routing/app_router.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/core/theming/colors.dart';

class TaskyApp extends StatelessWidget {
  final AppRouter appRouter;
  const TaskyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 656),
      minTextAdapt: true,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: ColorsManager.mainPurple,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppConstants.isLoggedIn
            ? Routes.homeScreen
            : Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoutes,
      ),
    );
  }
}
