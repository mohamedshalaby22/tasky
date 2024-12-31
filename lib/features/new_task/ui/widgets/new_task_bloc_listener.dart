import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/widgets/app_snack_bar.dart';
import 'package:tasky/features/new_task/logic/cubit/new_task_cubit.dart';

class NewTaskBlocListener extends StatelessWidget {
  const NewTaskBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewTaskCubit, NewTaskState>(
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
            if (ModalRoute.of(context)?.settings.name != Routes.homeScreen) {
              context.pop();
              context.pushNamedAndRemoveUntil(Routes.homeScreen,
                  predicate: (Route<dynamic> route) => false);
            }
            print('success Data');
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
