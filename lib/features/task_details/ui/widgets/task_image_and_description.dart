import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/styles.dart';

class TaskImageAndDescription extends StatelessWidget {
  const TaskImageAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/task_image.png'),
        verticalSpacing(10),
        Text('Grocery Shopping App', style: TextStyles.font24MainBlackBold),
        verticalSpacing(5),
        Text(
            'This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping.',
            style: TextStyles.font14GreyRegular.copyWith(height: 2)),
      ],
    );
  }
}
