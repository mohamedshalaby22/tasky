import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/core/widgets/app_text_form_field.dart';
import 'package:tasky/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:tasky/features/signup/ui/widgets/choose_experience_level.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/auth_phone_text_form_field.dart';

class SignUpForms extends StatefulWidget {
  const SignUpForms({super.key});

  @override
  State<SignUpForms> createState() => _SignUpFormsState();
}

class _SignUpFormsState extends State<SignUpForms> {
  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacing(20),
          Text('Sign Up', style: TextStyles.font24MainBlackBold),
          verticalSpacing(20),
          AppTextFormField(
              controller: context.read<SignUpCubit>().nameController,
              hintText: 'Name...',
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter your name';
                }
              }),
          verticalSpacing(15),
          AuthPhoneTextFormField(
            controller: context.read<SignUpCubit>().phoneController,
          ),
          verticalSpacing(15),
          AppTextFormField(
              controller: context.read<SignUpCubit>().yearsController,
              textInputType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              hintText: 'Years of experience...',
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter years of experience';
                }
              }),
          verticalSpacing(15),
          ChooseExperienceLevel(
            onSelect: (String level) {
              context.read<SignUpCubit>().level = level;
            },
          ),
          verticalSpacing(15),
          AppTextFormField(
              controller: context.read<SignUpCubit>().addressController,
              hintText: 'Address...',
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter your address';
                }
              }),
          verticalSpacing(15),
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            hintText: 'Password...',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
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
      ),
    );
  }
}
