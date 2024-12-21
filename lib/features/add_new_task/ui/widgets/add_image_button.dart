import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 1,
      borderType: BorderType.RRect,
      dashPattern: const [3, 3],
      color: ColorsManager.mainPurple,
      radius: const Radius.circular(10),
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/add_image.png',
                width: 25,
              ),
              horizontalSpacing(10),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  'Add Img',
                  style: TextStyles.font19MainPurpleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
