import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/widgets/app_snack_bar.dart';
import '../../../../core/helpers/haptic_feedback.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/cubit/sign_up_cubit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainPurple,
                ),
              ),
            );
          },
          success: (signupResponse) async {
            context.pop();
            context.pushNamedAndRemoveUntil(Routes.homeScreen,
                predicate: (Route<dynamic> route) => false);
            AppSnackBar.showSnackBarWidget(
              context: context,
              message: 'Signup Succesfully!',
            );
            await HapticFeedbackExtension.vibrateSuccess();
          },
          error: (error) {
            AppSnackBar.showSnackBarWidget(
                context: context,
                message: error.toString(),
                backColor: Colors.red[200]!);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
