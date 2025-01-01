import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/widgets/app_snack_bar.dart';
import 'package:tasky/core/widgets/app_text_button.dart';
import 'package:tasky/core/widgets/custom_appbar.dart';
import 'package:tasky/features/new_task/logic/add_cubit/new_task_cubit.dart';
import 'package:tasky/features/new_task/ui/widgets/add_task/add_image_button.dart';
import 'package:tasky/features/new_task/ui/widgets/add_task/new_task_forms.dart';
import '../widgets/add_task/new_task_bloc_listener.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add new task'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(5),
                const AddImageButton(),
                verticalSpacing(15),
                const NewTaskForms(),
                verticalSpacing(15),
                AppTextButton(
                    buttonText: 'Add task',
                    onPressed: () {
                      validateAndAddTask(context);
                    }),
                verticalSpacing(20),
                const NewTaskBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndAddTask(BuildContext context) {
    final taskCubit = context.read<NewTaskCubit>();

    if (taskCubit.formKey.currentState!.validate() &&
        taskCubit.selectedImage != null &&
        taskCubit.selectedDate.isNotEmpty) {
      taskCubit.uploadImageAndAddData();
    } else {
      AppSnackBar.showSnackBarWidget(
          context: context,
          message: 'Please cpmplete all the fields...',
          backColor: Colors.red[200]!);
    }
  }
}
