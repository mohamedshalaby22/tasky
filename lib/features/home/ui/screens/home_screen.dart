import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/di/dependency_injection.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/features/home/logic/cubit/tasks_cubit.dart';
import 'package:tasky/features/home/ui/widgets/floating_action_buttons.dart';
import 'package:tasky/features/home/ui/widgets/home_app_bar.dart';
import 'package:tasky/features/home/ui/widgets/task_list_view.dart';
import 'package:tasky/features/home/ui/widgets/task_status_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButtons(),
      appBar: const HomeAppBar(),
      body: SafeArea(
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
            const TasksListView()
          ],
        ),
      ),
    );
  }
}

