import 'package:flutter/material.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/core/widgets/app_text_form_field.dart';
import 'package:tasky/features/sing_up/ui/widgets/choose_experience_level.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/auth_phone_text_form_field.dart';

class SignUpForms extends StatefulWidget {
  const SignUpForms({super.key});

  @override
  State<SignUpForms> createState() => _SignUpFormsState();
}

class _SignUpFormsState extends State<SignUpForms> {
  final _formKey = GlobalKey<FormState>();
  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing(20),
        Text('Sign Up', style: TextStyles.font24BlackBold),
        verticalSpacing(20),
        AppTextFormField(
            hintText: 'Name...',
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please enter your name';
              }
            }),
        verticalSpacing(15),
        AuthPhoneTextFormField(controller: TextEditingController()),
        verticalSpacing(15),
        AppTextFormField(
            hintText: 'Years of experience...',
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please enter years of experience';
              }
            }),
        verticalSpacing(15),
        ChooseExperienceLevel(
          onSelect: (String level) {},
        ),
        verticalSpacing(15),
        AppTextFormField(
            hintText: 'Address...',
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please enter your address';
              }
            }),
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
      ],
    );
  }
}
