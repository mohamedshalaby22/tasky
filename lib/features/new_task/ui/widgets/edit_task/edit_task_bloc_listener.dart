import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/capitalize_first.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/widgets/app_snack_bar.dart';
import '../../../logic/edit_cubit/edit_task_cubit.dart';

class EditTaskBlocListener extends StatelessWidget {
  const EditTaskBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditTaskCubit, EditTaskState>(
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
          success: (response) {
            print(response);
            // context.pop();
            // context.pushNamedAndRemoveUntil(Routes.homeScreen,
            //     predicate: (Route<dynamic> route) => false);
            // AppSnackBar.showSnackBarWidget(
            //   context: context,
            //   message: 'Edit task added successfully!'.capitalizeFirst(),
            // );
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
