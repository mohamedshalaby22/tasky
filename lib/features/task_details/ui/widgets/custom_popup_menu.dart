import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:tasky/core/theming/styles.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPopup(
      barrierColor: Colors.white.withOpacity(0.1),
      backgroundColor: Colors.white,
      content: SizedBox(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit',
              style: TextStyles.font16MainBlackMedium,
            ),
            const Divider(thickness: 0.3),
            Text(
              'Delete',
              style: TextStyles.font16RedMedium,
            ),
          ],
        ),
      ),
      child: const Icon(Icons.more_vert_outlined),
    );
  }
}