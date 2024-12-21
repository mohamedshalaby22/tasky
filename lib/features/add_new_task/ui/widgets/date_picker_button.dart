import 'package:flutter/material.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';

class DatePickerButton extends StatefulWidget {
  const DatePickerButton({super.key, required this.onSelect});
  final Function(String date) onSelect;
  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  String date = 'choose due date...';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDatePicker(context, (date) {
          this.date = date;
          widget.onSelect(date);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorsManager.lighterGrey, width: 1.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: TextStyles.font14GreyRegular,
            ),
            Image.asset(
              'assets/images/calendar.png',
              width: 25,
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker(
      BuildContext context, Function(String date) onSelect) async {
    String selectedDate = '';
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2026),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: ColorsManager.mainPurple,
                onPrimary: Colors.white,
                onSurface: ColorsManager.grey,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: ColorsManager.grey,
                ),
              ),
            ),
            child: child!,
          );
        });
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate.toLocal().toString().split(' ')[0];
        onSelect(selectedDate);
      });
    }
  }
}
