import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/di/dependency_injection.dart';
import 'package:tasky/core/helpers/auth_status_handler.dart';
import 'package:tasky/core/routing/app_router.dart';
import 'package:tasky/tasky_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  setupGetIt();
  await AuthStatusHandler.checkUserLoginStatus();
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  runApp(TaskyApp(appRouter: AppRouter()));
  FlutterNativeSplash.remove();
}
