import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/widgets/app_text_button.dart';
import 'package:tasky/features/add_new_task/ui/widgets/add_image_button.dart';
import 'package:tasky/features/add_new_task/ui/widgets/new_task_app_bar.dart';
import 'package:tasky/features/add_new_task/ui/widgets/new_task_forms.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewTaskAppBar(),
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
                AppTextButton(buttonText: 'Add task', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
