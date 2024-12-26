import 'package:flutter/material.dart';
import 'package:tasky/core/constants/app_images.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/routing/routes.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: FloatingActionButton(
            elevation: 0.5,
            heroTag: 'tag1',
            backgroundColor: ColorsManager.lightPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: () {},
            child: Image.asset(
              Assets.imagesBarcodeIcon,
              width: 20,
            ),
          ),
        ),
        verticalSpacing(10),
        FloatingActionButton(
          heroTag: 'tag2',
          backgroundColor: ColorsManager.mainPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {
            context.pushNamed(Routes.newTaskScreen);
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ],
    );
  }
}
