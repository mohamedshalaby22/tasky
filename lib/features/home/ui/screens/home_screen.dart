import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/features/home/logic/cubit/tasks_cubit.dart';
import 'package:tasky/features/home/ui/widgets/floating_action_buttons.dart';
import 'package:tasky/features/home/ui/widgets/home_app_bar.dart';
import 'package:tasky/features/home/ui/widgets/task_status_list.dart';
import 'package:tasky/features/home/ui/widgets/tasks_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButtons(),
      appBar: const HomeAppBar(),
      body: SizedBox(
        height: double.maxFinite,
        child: SafeArea(
          child: RefreshIndicator(
            backgroundColor: Colors.white,
            color: ColorsManager.mainPurple,
            onRefresh: () async {
            await  context.read<TasksCubit>().getTasks();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'My Tasks',
                    style: TextStyles.font16GreyBold,
                  ),
                ),
                verticalSpacing(15),
                const TaskStatusList(),
                verticalSpacing(20),
                const TasksBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
