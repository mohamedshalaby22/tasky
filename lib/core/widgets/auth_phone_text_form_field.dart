import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';

class AuthPhoneTextFormField extends StatelessWidget {
  const AuthPhoneTextFormField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: 'EG',
    
      flagsButtonMargin: const EdgeInsets.only(left: 10),
      disableLengthCheck: false,
      dropdownIconPosition: IconPosition.trailing,
      dropdownIcon: const Icon(Icons.keyboard_arrow_down,
          color: ColorsManager.lighterGrey),
      pickerDialogStyle: PickerDialogStyle(
        listTileDivider: const Divider(thickness: 0.3),
        width: double.infinity,
        searchFieldPadding: const EdgeInsets.only(top: 15),
        backgroundColor: Colors.white,
        searchFieldInputDecoration: InputDecoration(
          isDense: true,
          filled: false,
          hintText: 'Search...',
          hintStyle: TextStyles.font14GreyRegular,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color(0xFFBABABA), width: 1.1)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: ColorsManager.mainPurple, width: 1.1),
          ),
        ),
      ),
      decoration: InputDecoration(
        hintText: '123 456-7890',
        hintStyle: TextStyles.font14LighterGreyRegular,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: ColorsManager.lighterGrey, width: 1.1)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: ColorsManager.mainPurple, width: 1.1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1.1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1.1),
        ),
      ),
    );
  }
}
