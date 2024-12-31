import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/widgets/auth_phone_text_form_field.dart';
import 'package:tasky/features/login/logic/cubit/login_cubit.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class PhoneAndPaswordForms extends StatefulWidget {
  const PhoneAndPaswordForms({super.key});

  @override
  State<PhoneAndPaswordForms> createState() => _PhoneAndPaswordFormsState();
}

class _PhoneAndPaswordFormsState extends State<PhoneAndPaswordForms> {
  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
       key: context.read<LoginCubit>().formKey, 
      child: Column(
        children: [
          verticalSpacing(15),
          AuthPhoneTextFormField(
              controller: context.read<LoginCubit>().phoneController),
          verticalSpacing(15),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
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
          verticalSpacing(20),
        ],
      ),
    );
  }
}
