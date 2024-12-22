import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/di/dependency_injection.dart';
import 'package:tasky/core/routing/app_router.dart';
import 'package:tasky/tasky_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  ScreenUtil.ensureScreenSize();
  runApp(TaskyApp(appRouter: AppRouter()));
}
