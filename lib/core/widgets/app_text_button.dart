import 'package:flutter/material.dart';
import 'package:tasky/core/theming/colors.dart';
import '../theming/styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.buttonText,
    this.borderRadius,
    this.buttonWidth,
    this.buttonHeight,
    this.backgroundColor,
    required this.onPressed,
  });
  final String buttonText;
  final double? borderRadius, buttonWidth, buttonHeight;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorsManager.mainPurple,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16)),
          minimumSize: Size(buttonWidth ?? double.infinity, buttonHeight ?? 56),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyles.font16WhiteBold,
        ));
  }
}
