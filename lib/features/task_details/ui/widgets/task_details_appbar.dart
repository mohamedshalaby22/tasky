import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/features/task_details/ui/widgets/custom_popup_menu.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

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
          const CustomPopupMenu(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}


