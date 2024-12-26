import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/constants/app_images.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/core/widgets/app_text_button.dart';
import 'package:tasky/core/widgets/responsive_image.dart';
import 'package:tasky/features/login/logic/cubit/login_cubit.dart';
import 'package:tasky/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:tasky/features/login/ui/widgets/login_bloc_listener.dart';
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
            const ResponsiveImage(
              imagePath: Assets.imagesAuthImage,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(15),
                  Text('Login', style: TextStyles.font24MainBlackBold),
                  const PhoneAndPaswordForms(),
                  AppTextButton(
                      buttonText: 'Sign In',
                      onPressed: () {
                        validateThenDoLogin(context);
                      }),
                  verticalSpacing(15),
                  const DontHaveAccountText(),
                  const LoginBlocListener(),
                  verticalSpacing(15),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().emitLoginStates();
  }
}
