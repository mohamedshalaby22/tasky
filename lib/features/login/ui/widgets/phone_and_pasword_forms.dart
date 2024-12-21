import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/widgets/auth_phone_text_form_field.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class PhoneAndPaswordForms extends StatefulWidget {
  const PhoneAndPaswordForms({super.key});

  @override
  State<PhoneAndPaswordForms> createState() => _PhoneAndPaswordFormsState();
}

class _PhoneAndPaswordFormsState extends State<PhoneAndPaswordForms> {
  TextEditingController controller = TextEditingController();
  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacing(15),
        AuthPhoneTextFormField(controller: controller),
        verticalSpacing(15),
        AppTextFormField(
          hintText: 'Password...',
          validator: (value) {
            if (value != null && value.length < 6 && value.isNotEmpty) {
              return 'Password must be at least 6 characters';
            }
          },
          isObscureText: isObsecureText,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isObsecureText = !isObsecureText;
              });
            },
            child: Icon(
              isObsecureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: ColorsManager.lighterGrey,
              size: 25,
            ),
          ),
        ),
        verticalSpacing(20),
      ],
    );
  }
}
