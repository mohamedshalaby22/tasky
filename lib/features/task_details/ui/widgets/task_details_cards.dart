import 'package:flutter/material.dart';
import 'package:tasky/core/constants/app_images.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';

class TaskDetailsCards extends StatelessWidget {
  const TaskDetailsCards({super.key});

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
                      '30 June, 2022',
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
              'Inprogress',
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
            Text('Medium Priority', style: TextStyles.font16MainPurpleBold),
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
