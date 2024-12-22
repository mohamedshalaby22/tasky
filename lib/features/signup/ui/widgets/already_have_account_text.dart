import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/theming/styles.dart';
import '../../../../core/routing/routes.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: 'Already have any account? ',
            style: TextStyles.font14GreyRegular,
          ),
          TextSpan(
              text: ' Sign In here',
              style: TextStyles.font14MainPurpleBold
                  .copyWith(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(Routes.loginScreen);
                }),
        ]),
      ),
    );
  }
}
