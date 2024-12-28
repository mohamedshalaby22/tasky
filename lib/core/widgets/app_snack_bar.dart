import 'package:flutter/material.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';

class AppSnackBar {
  static showSnackBarWidget(
      {required BuildContext context,
      required String message,
      Color backColor = ColorsManager.mainPurple}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: backColor,
        elevation: 3,
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: TextStyles.font14WhiteMedium,
        )));
  }
}
