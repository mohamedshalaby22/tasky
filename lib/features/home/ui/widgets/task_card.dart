import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/constants/app_constants.dart';
import 'package:tasky/core/constants/app_images.dart';
import 'package:tasky/core/helpers/capitalize_first.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/font_weight_helper.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/features/home/logic/utils/task_priority_color.dart';
import 'package:tasky/features/home/logic/utils/task_status_color.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.status,
      required this.priority,
      required this.date});
  final String imagePath, title, description, status, priority, date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                 Assets.imagesTaskImage,
                  width: 70,
                  fit: BoxFit.contain,
                ),
                horizontalSpacing(5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.font16MainBlackBold,
                            ),
                          ),
                          horizontalSpacing(12),
                          statusCard(status: status),
                        ],
                      ),
                      verticalSpacing(5),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: Text(
                          description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font14GreyRegular,
                        ),
                      ),
                      verticalSpacing(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/${TaskPriorityColor.getTaskPriorityIconColor(
                                  Priorities.values.byName(
                                    priority,
                                  ),
                                )}_flag.png',
                                width: 18,
                              ),
                              horizontalSpacing(3),
                              Text(
                                priority.capitalizeFirst(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: TaskPriorityColor.getTaskPriorityColor(
                                      Priorities.values.byName(priority)),
                                  fontWeight: FontWeightHelper.medium,
                                  fontFamily: AppConstants.appFontFamily,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            date,
                            style: TextStyles.font12GreyRegular,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          horizontalSpacing(10),
          const Icon(
            Icons.more_vert,
            size: 26,
          )
        ],
      ),
    );
  }

  Container statusCard({required String status}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: TaskStatusColor.getTaskStatusBackgroundColor(
            TaskStatus.values.byName(status)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        status.capitalizeFirst(),
        style: TextStyle(
          fontFamily: AppConstants.appFontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: TaskStatusColor.getTaskStatusColor(
              TaskStatus.values.byName(status)),
        ),
      ),
    );
  }
}
