import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/core/widgets/app_text_form_field.dart';
import 'package:tasky/features/new_task/ui/widgets/add_task/choose_priority_button.dart';
import 'package:tasky/features/new_task/ui/widgets/add_task/date_picker_button.dart';
import '../../../logic/add_cubit/new_task_cubit.dart';

class NewTaskForms extends StatefulWidget {
  const NewTaskForms({super.key});

  @override
  State<NewTaskForms> createState() => _NewTaskFormsState();
}

class _NewTaskFormsState extends State<NewTaskForms> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<NewTaskCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task title',
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpacing(8),
          AppTextFormField(
              controller: context.read<NewTaskCubit>().titleController,
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
              controller: context.read<NewTaskCubit>().descriptionController,
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
              context.read<NewTaskCubit>().selectedPriority = priority;
            });
          }),
          verticalSpacing(15),
          Text(
            'Due date',
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpacing(8),
          DatePickerButton(
            onSelect: (String date) {
              setState(() {
                context.read<NewTaskCubit>().selectedDate = date;
              });
            },
          ),
        ],
      ),
    );
  }
}
