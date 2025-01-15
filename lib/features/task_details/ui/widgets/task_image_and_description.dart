import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/capitalize_first.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/styles.dart';

class TaskImageAndDescription extends StatelessWidget {
  const TaskImageAndDescription(
      {super.key,
      required this.title,
      required this.description,
      required this.imagePath});
  final String title, description, imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CachedNetworkImage(
            imageUrl: 'https://todo.iraqsapp.com/images/$imagePath',
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        verticalSpacing(10),
        Text(title.capitalizeFirst(), style: TextStyles.font24MainBlackBold),
        verticalSpacing(5),
        Text(description.capitalizeFirst(),
            style: TextStyles.font14GreyRegular.copyWith(height: 2)),
      ],
    );
  }
}
