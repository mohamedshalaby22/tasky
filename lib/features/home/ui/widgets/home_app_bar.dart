import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/constants/app_images.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/routing/routes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              Assets.imagesAppIcon,
              fit: BoxFit.contain,
              width: 45,
              height: 45,
            ),
          ),
          const Spacer(),
          GestureDetector(
              onTap: () {
                context.pushNamed(Routes.profileScreen);
              },
              child: SvgPicture.asset(Assets.svgsProfileIcon)),
          horizontalSpacing(15),
          SvgPicture.asset(Assets.svgsLogoutIcon),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
