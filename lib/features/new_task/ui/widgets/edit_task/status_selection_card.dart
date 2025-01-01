import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/capitalize_first.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/core/constants/app_images.dart';
import 'package:tasky/features/task_details/ui/widgets/task_details_cards.dart';

class StatusSelectionCard extends StatefulWidget {
  const StatusSelectionCard({super.key, required this.onSelect, required this.status});

  final Function(String) onSelect;
  final String status;

  @override
  State<StatusSelectionCard> createState() => _StatusSelectionCardState();
}

class _StatusSelectionCardState extends State<StatusSelectionCard> {
  final List<String> statuses = [
    'Waiting',
    'Inprogress',
    'Finished',
  ];

  @override
  Widget build(BuildContext context) {
    return buildInfoCard(
      child: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        offset: const Offset(16, 30),
        onSelected: (value) {
          setState(() {
            widget.onSelect(value.toLowerCase());
          });
        },
        itemBuilder: (BuildContext context) {
          return statuses.map((status) {
            return PopupMenuItem<String>(
              height: 30,
              value: status,
              child: Text(
                status,
                style: TextStyles.font14MainPurplMedium,
              ),
            );
          }).toList();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.status.capitalizeFirst(),
              style: TextStyles.font16MainPurpleBold,
            ),
            Image.asset(
              Assets.imagesPurpleArrowDown,
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
