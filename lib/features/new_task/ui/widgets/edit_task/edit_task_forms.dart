import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/core/widgets/app_text_form_field.dart';
import 'package:tasky/features/new_task/ui/widgets/add_task/choose_priority_button.dart';
import 'package:tasky/features/new_task/ui/widgets/edit_task/status_selection_card.dart';
import '../../../logic/edit_cubit/edit_task_cubit.dart';

class EditTaskForm extends StatefulWidget {
  const EditTaskForm({super.key});

  @override
  State<EditTaskForm> createState() => _EditTaskFormState();
}

class _EditTaskFormState extends State<EditTaskForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<EditTaskCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task title',
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpacing(8),
          AppTextFormField(
              controller: context.read<EditTaskCubit>().titleController,
              hintText: 'Enter title here...',
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter task title';
                }
              }),
          verticalSpacing(15),
          Text(
            'Task Description',
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpacing(8),
          AppTextFormField(
              controller: context.read<EditTaskCubit>().descriptionController,
              hintText: 'Enter description here...',
              maxLines: 6,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter task description';
                }
              }),
          verticalSpacing(15),
          Text(
            'Priority',
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpacing(8),
          ChoosePriorityButton(onSelect: (priority) {
            setState(() {
              context.read<EditTaskCubit>().selectedPriority =
                  priority.toLowerCase();
            });
          }),
          verticalSpacing(15),
          Text(
            'Status',
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpacing(8),
          StatusSelectionCard(
            status: context.read<EditTaskCubit>().selectedStatus,
            onSelect: (String selectedStatus) {
              setState(() {
                context.read<EditTaskCubit>().selectedStatus =
                    selectedStatus.toLowerCase();
              });
            },
          ),
        ],
      ),
    );
  }
}
