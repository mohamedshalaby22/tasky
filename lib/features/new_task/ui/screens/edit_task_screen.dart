import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import '../../../../core/widgets/custom_appbar.dart';
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
