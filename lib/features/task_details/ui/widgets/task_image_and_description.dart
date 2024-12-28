import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/styles.dart';

class TaskImageAndDescription extends StatelessWidget {
  const TaskImageAndDescription(
      {super.key, required this.title, required this.description});
  final String title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/task_image.png'),
        verticalSpacing(10),
        Text(title, style: TextStyles.font24MainBlackBold),
        verticalSpacing(5),
        Text(description,
            style: TextStyles.font14GreyRegular.copyWith(height: 2)),
      ],
    );
  }
}
