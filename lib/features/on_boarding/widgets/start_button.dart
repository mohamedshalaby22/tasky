import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: ColorsManager.mainPurple,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          minimumSize: const Size(double.infinity, 56),
        ),
        onPressed: () {
          context.pushNamed(Routes.loginScreen);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Let\'s Start',
              style: TextStyles.font19WhiteBold,
            ),
            horizontalSpacing(5),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Image.asset(
                'assets/images/white_arrow_left_icon.png',
                width: 25,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ));
  }
}
