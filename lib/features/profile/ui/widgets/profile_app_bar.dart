import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/features/home/ui/widgets/home_app_bar.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

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
              context.pop();
            },
            child: Image.asset(
              'assets/images/black_arrow_left_icon.png',
              width: 30,
            ),
          ),
          horizontalSpacing(10),
          Text(
            'Profile',
            style: TextStyles.font16MainBlackBold,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
