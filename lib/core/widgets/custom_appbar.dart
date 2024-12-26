import 'package:flutter/material.dart';
import 'package:tasky/core/constants/app_images.dart';
import 'package:tasky/core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (onBackPressed != null) {
                onBackPressed!();
              } else {
                context.pop();
              }
            },
            child: Image.asset(
              Assets.imagesBlackArrowLeftIcon,
              width: 30,
            ),
          ),
          horizontalSpacing(10),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              title,
              style: TextStyles.font16MainBlackBold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
