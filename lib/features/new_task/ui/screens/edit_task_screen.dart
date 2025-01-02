import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/features/new_task/ui/widgets/edit_task/edit_task_bloc_listener.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../logic/edit_cubit/edit_task_cubit.dart';
import '../widgets/edit_task/edit_image_button.dart';
import '../widgets/edit_task/edit_task_forms.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit task'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(10),
                const EditImageWidget(),
                verticalSpacing(15),
                const EditTaskForm(),
                verticalSpacing(10),
                AppTextButton(
                    buttonText: 'Edit task',
                    onPressed: () {
                      validateAndEditTask(context);
                    }),
                verticalSpacing(20),
                const EditTaskBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndEditTask(BuildContext context) {
    final taskCubit = context.read<EditTaskCubit>();
    if (taskCubit.formKey.currentState!.validate()) {
      taskCubit.uploadImageAndUpdateTask();
    }
  }
}
