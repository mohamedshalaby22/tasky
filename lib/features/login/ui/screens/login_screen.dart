import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/core/widgets/app_text_button.dart';
import 'package:tasky/core/widgets/responsive_image.dart';
import 'package:tasky/features/login/ui/widgets/dont_have_account_text.dart';
import '../widgets/phone_and_pasword_forms.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const ResponsiveImage(imagePath: 'assets/images/auth_image.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(15),
                  Text('Login', style: TextStyles.font24BlackBold),
                  const PhoneAndPaswordForms(),
                  AppTextButton(buttonText: 'Sign In', onPressed: () {
                    context.pushReplacementNamed(Routes.homeScreen);
                  }),
                  verticalSpacing(15),
                  const DontHaveAccountText(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
