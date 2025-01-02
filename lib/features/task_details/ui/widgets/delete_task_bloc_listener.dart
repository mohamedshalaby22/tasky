import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/capitalize_first.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/widgets/app_snack_bar.dart';
import 'package:tasky/features/task_details/logic/cubit/task_details_cubit.dart';
import '../../../../core/helpers/haptic_feedback.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';

class DeleteTaskBlocListener extends StatelessWidget {
  const DeleteTaskBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskDetailsCubit, TaskDetailsState>(
      listenWhen: (previous, current) =>
          current is DeleteLoading ||
          current is DeleteSuccess ||
          current is DeleteError,
      listener: (context, state) {
        state.whenOrNull(
          deleteLoading: () {
            context.pop();
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainPurple,
                ),
              ),
            );
          },
          deleteSuccess: () async {
            context.pop();
            context.pushNamedAndRemoveUntil(Routes.homeScreen,
                predicate: (Route<dynamic> route) => false);
            AppSnackBar.showSnackBarWidget(
              context: context,
              message: 'Task deleted successfully!'.capitalizeFirst(),
            );
            await HapticFeedbackExtension.vibrateLight();
          },
          deleteError: (error) {
            context.pop();
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
