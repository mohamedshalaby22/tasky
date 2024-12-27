import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/routing/app_router.dart';
import 'package:tasky/core/widgets/app_text_button.dart';
import 'package:tasky/core/widgets/custom_appbar.dart';
import 'package:tasky/features/new_task/logic/cubit/new_task_cubit.dart';
import 'package:tasky/features/new_task/ui/widgets/add_image_button.dart';
import 'package:tasky/features/new_task/ui/widgets/new_task_forms.dart';

import '../widgets/new_task_bloc_listener.dart';

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
                      context.read<NewTaskCubit>().uploadImageAndAddData();
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
}
