import 'package:flutter/material.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';

class ChooseExperienceLevel extends StatefulWidget {
  const ChooseExperienceLevel({super.key, required this.onSelect});
  final Function(String level) onSelect;
  @override
  State<ChooseExperienceLevel> createState() => _ChooseExperienceLevelState();
}

class _ChooseExperienceLevelState extends State<ChooseExperienceLevel> {
  String selectedValue = 'Choose Experience Level';
  List<String> levels = [
    'Jounior',
    'Mid Level',
    'Senior',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorsManager.lighterGrey, width: 1.1),
      ),
      child: PopupMenuButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        offset: const Offset(16, 30),
        onSelected: (value) {
          setState(() {
            selectedValue = value;
            widget.onSelect(value);
          });
        },
        itemBuilder: (BuildContext context) {
          return levels.map((str) {
            return PopupMenuItem(
              height: 30,
              value: str,
              child: Text(
                str,
                style: TextStyles.font14MainBlackMedium,
              ),
            );
          }).toList();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedValue,
              style: TextStyles.font14MainBlackMedium,
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: ColorsManager.lighterGrey,
            )
          ],
        ),
      ),
    );
  }
}
