import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/constants/app_images.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/features/home/logic/cubit/tasks_cubit.dart';
import 'package:tasky/features/home/ui/widgets/logout_bloc_listener.dart';
import '../../../task_details/ui/widgets/task_details_cards.dart';

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
          GestureDetector(
              onTap: () {
                _logoutSheet(context);
              },
              child: SvgPicture.asset(Assets.svgsLogoutIcon)),
          const LogoutBlocListener(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

Future<dynamic> _logoutSheet(BuildContext context) {
  final tasksCubit = context.read<TasksCubit>();
  return showModalBottomSheet(
    elevation: 0.0,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    context: context,
    builder: (context) {
      return Container(
        margin: const EdgeInsets.all(16),
        width: double.infinity,
        height: 150,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: ColorsManager.lighterPurple,
                  child: Icon(
                    Icons.close,
                    color: ColorsManager.mainPurple,
                  ),
                ),
              ),
            ),
            verticalSpacing(15),
            GestureDetector(
              onTap: () {
                tasksCubit.logout();
              },
              child: buildInfoCard(
                  child: Row(
                children: [
                  SvgPicture.asset(Assets.svgsLogoutIcon),
                  horizontalSpacing(10),
                  Text(
                    'Logout',
                    style: TextStyles.font16MainPurpleBold,
                  ),
                ],
              )),
            ),
          ],
        ),
      );
    },
  );
}
