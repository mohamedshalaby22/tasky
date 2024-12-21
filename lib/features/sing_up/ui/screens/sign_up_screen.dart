import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/widgets/app_text_button.dart';
import 'package:tasky/core/widgets/responsive_image.dart';
import 'package:tasky/features/sing_up/ui/widgets/sign_up_forms.dart';
import '../widgets/already_have_account_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResponsiveImage(
                imagePath: 'assets/images/auth_image.png', isMaxHeight: false),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SignUpForms(),
                  verticalSpacing(20),
                  AppTextButton(buttonText: 'Sign Up', onPressed: () {}),
                  verticalSpacing(15),
                  const AlreadyHaveAccountText(),
                ],
              ),
            ),
            verticalSpacing(15),
          ],
        ),
      ),
    ));
  }
}
