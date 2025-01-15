import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/capitalize_first.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/features/home/data/models/tasks_list_response.dart';
import 'package:tasky/features/home/ui/widgets/task_card.dart';

// ignore: must_be_immutable
class TasksListView extends StatelessWidget {
  TasksListView({super.key, required this.tasksList});
  List<TasksListResponse> tasksList = [];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.pushNamed(Routes.taskDetailsScreen,
                  arguments: tasksList[index].id);
            },
            child: TaskCard(
              imagePath:
                  'https://todo.iraqsapp.com/images/${tasksList[index].image}',
              title: tasksList[index].title.capitalizeFirst(),
              description: tasksList[index].desc.capitalizeFirst().trim(),
              status: tasksList[index].status,
              priority: tasksList[index].priority,
              date: '30/07/2022',
            ),
          );
        },
      ),
    );
  }
}
