import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasky/core/helpers/haptic_feedback.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';

import '../../../../core/constants/app_images.dart';

class UserProfileInfoRow extends StatelessWidget {
  const UserProfileInfoRow(
      {super.key,
      required this.title,
      required this.subTitle,
      this.canCopy = false});
  final String title, subTitle;
  final bool canCopy;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: ColorsManager.veryLightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.font12GreyMedium,
              ),
              verticalSpacing(3),
              Text(
                subTitle,
                style: TextStyles.font18GreyBold,
              ),
            ],
          ),
          if (canCopy)
            GestureDetector(
                onTap: () async {
                  Clipboard.setData(ClipboardData(text: subTitle));
                  await HapticFeedbackExtension.vibrateSelection();
                },
                child: Image.asset(Assets.imagesCopyIcon, width: 25)),
        ],
      ),
    );
  }
}
