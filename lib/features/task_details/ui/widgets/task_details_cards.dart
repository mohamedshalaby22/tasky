import 'package:flutter/material.dart';
import 'package:tasky/core/constants/app_images.dart';
import 'package:tasky/core/helpers/capitalize_first.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';

class TaskDetailsCards extends StatelessWidget {
  const TaskDetailsCards({super.key, required this.status, required this.date, required this.priority});
final String status,date,priority;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInfoCard(
            verticalPadding: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'End Date',
                      style: TextStyles.font9GreyRegular,
                    ),
                    verticalSpacing(3),
                    Text(
                     date,
                      style: TextStyles.font14MainBlackMedium,
                    ),
                  ],
                ),
                Image.asset(
                  Assets.imagesCalendar,
                  width: 25,
                ),
              ],
            )),
        buildInfoCard(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              status.capitalizeFirst(),
              style: TextStyles.font16MainPurpleBold,
            ),
            Image.asset(
              Assets.imagesPurpleArrowDown,
              width: 15,
            ),
          ],
        )),
        buildInfoCard(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(Assets.imagesPurpleFlag, width: 20),
            horizontalSpacing(10),
            Text('$priority Priority'.capitalizeFirst(), style: TextStyles.font16MainPurpleBold),
            const Spacer(),
            Image.asset(Assets.imagesPurpleArrowDown, width: 15),
          ],
        )),
      ],
    );
  }
}

Container buildInfoCard(
    {required Widget child, double verticalPadding = 15}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: EdgeInsets.only(
        left: 20, right: 15, top: verticalPadding, bottom: verticalPadding),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: ColorsManager.lightPurple,
    ),
    child: child,
  );
}
