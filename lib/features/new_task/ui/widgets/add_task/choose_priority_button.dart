import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';
import '../../../../../core/constants/app_images.dart';

class ChoosePriorityButton extends StatefulWidget {
  const ChoosePriorityButton({super.key, required this.onSelect});
  final Function(String level) onSelect;
  @override
  State<ChoosePriorityButton> createState() => _ChoosePriorityButtonState();
}

class _ChoosePriorityButtonState extends State<ChoosePriorityButton> {
  String selectedValue = 'Medium Priority';
  List<String> priorities = [
    'Low Priority',
    'Medium Priority',
    'High Priority',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: ColorsManager.lighterPurple,
          borderRadius: BorderRadius.circular(10)),
      child: PopupMenuButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        offset: const Offset(16, 30),
        onSelected: (value) {
          setState(() {
            selectedValue = value;
            widget.onSelect(selectedValue.split(' ')[0].toLowerCase());
          });
        },
        itemBuilder: (BuildContext context) {
          return priorities.map((str) {
            return PopupMenuItem(
              height: 30,
              value: str,
              child: Text(
                str,
                style: TextStyles.font14MainPurplMedium,
              ),
            );
          }).toList();
        },
        child: Row(
          children: [
            Image.asset(Assets.imagesPurpleFlag, width: 20),
            horizontalSpacing(10),
            Text(selectedValue, style: TextStyles.font16MainPurpleBold),
            const Spacer(),
            Image.asset(Assets.imagesPurpleArrowDown, width: 15),
          ],
        ),
      ),
    );
  }
}
