import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/styles.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacing(50),
        Text(
          'Task Management &\n To-Do List',
          textAlign: TextAlign.center,
          style: TextStyles.font24BlackBold,
        ),
        verticalSpacing(10),
        Text(
          'This productive tool is designed to help\nyou better manage your task\nproject-wise conveniently!',
          textAlign: TextAlign.center,
          style: TextStyles.font14GreyRegular.copyWith(height: 1.7),
        ),
        verticalSpacing(25),
      ],
    );
  }
}
