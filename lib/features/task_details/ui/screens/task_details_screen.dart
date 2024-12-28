import 'package:flutter/material.dart';
import 'package:tasky/features/task_details/ui/widgets/task_details_appbar.dart';
import '../widgets/task_details_bloc_builder.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TaskDetailsAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TaskDetailsBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
