import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/features/task_details/logic/cubit/task_details_cubit.dart';
import 'package:tasky/features/task_details/ui/widgets/custom_popup_menu.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import 'task_details_cards.dart';

class TaskDetailsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TaskDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Image.asset(
              'assets/images/black_arrow_left_icon.png',
              width: 30,
            ),
          ),
          horizontalSpacing(10),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              'Task Details',
              style: TextStyles.font16MainBlackBold,
            ),
          ),
          const Spacer(),
          CustomPopupMenu(
            onEdit: () {
              context.pop();
              context.pushReplacementNamed(Routes.editTaskScreen,
                  arguments: context.read<TaskDetailsCubit>().taskId);
            },
            onDelete: () {
              context.pop();
              _deleteTaskSheet(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

Future<dynamic> _deleteTaskSheet(BuildContext context) {
  final taskDetailsCubit = context.read<TaskDetailsCubit>();
  return showModalBottomSheet(
    elevation: 0.0,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    context: context,
    builder: (context) {
      return Container(
        margin: const EdgeInsets.all(16),
        width: double.infinity,
        height: 150,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: ColorsManager.lighterPurple,
                  child: Icon(
                    Icons.close,
                    color: ColorsManager.mainPurple,
                  ),
                ),
              ),
            ),
            verticalSpacing(15),
            GestureDetector(
              onTap: () {
                taskDetailsCubit.deleteTask();
              },
              child: buildInfoCard(
                  child: Row(
                children: [
                  const Icon(Icons.delete, color: ColorsManager.mainPurple),
                  horizontalSpacing(10),
                  Text(
                    'Delete Task',
                    style: TextStyles.font16MainPurpleBold,
                  ),
                ],
              )),
            ),
          ],
        ),
      );
    },
  );
}
