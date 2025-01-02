import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/haptic_feedback.dart';
import 'package:tasky/features/home/logic/cubit/tasks_cubit.dart';
import 'package:tasky/features/home/logic/utils/task_status_color.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class TaskStatusList extends StatefulWidget {
  const TaskStatusList({super.key});

  @override
  State<TaskStatusList> createState() => _TaskStatusListState();
}

class _TaskStatusListState extends State<TaskStatusList> {
  int selectedIndex = 0;
  List<String> status = [
    'All',
    'In Progress',
    'Waiting',
    'Finished',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsetsDirectional.only(start: 16),
          itemCount: status.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                setState(() {
                  selectedIndex = index;
                });
                context
                    .read<TasksCubit>()
                    .filterTasksByStatus(TaskStatusHelper.getTaskText(index));
                await HapticFeedbackExtension.vibrateSelection();
              },
              child: taskStatusCard(
                title: status[index],
                isSelected: selectedIndex == index,
              ),
            );
          }),
    );
  }

  AnimatedContainer taskStatusCard(
      {required String title, required bool isSelected}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsetsDirectional.only(end: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color:
            isSelected ? ColorsManager.mainPurple : ColorsManager.lighterPurple,
      ),
      child: Text(
        title,
        style: isSelected
            ? TextStyles.font16WhiteBold
            : TextStyles.font16GreyRegular,
      ),
    );
  }
}
