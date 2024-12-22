import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/features/home/ui/widgets/task_card.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              context.pushNamed(Routes.taskDetailsScreen);
            },
            child: TaskCard(
              imagePath: 'assets/images/task_image.png',
              title: 'Grocery Shopping App',
              description: 'This application is designed for s',
              status: index.isEven ? 'waiting' : 'finished',
              priority:index.isEven ?'medium' :'low',
              date: '30/12/2022',
            ),
          );
        },
      ),
    );
  }
}
