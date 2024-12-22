import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/widgets/app_text_button.dart';
import 'package:tasky/core/widgets/responsive_image.dart';
import 'package:tasky/features/signup/ui/widgets/sign_up_forms.dart';
import 'package:tasky/features/signup/ui/widgets/signup_bloc_listener.dart';
import '../../logic/cubit/sign_up_cubit.dart';
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
                  AppTextButton(
                      buttonText: 'Sign Up',
                      onPressed: () {
                        validateThenDoSignup(context);
                      }),
                  verticalSpacing(15),
                  const AlreadyHaveAccountText(),
                  const SignupBlocListener(),
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

void validateThenDoSignup(BuildContext context) {
  if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
    context.read<SignUpCubit>().emitSignupStates();
  }
}
