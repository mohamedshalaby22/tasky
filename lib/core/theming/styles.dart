import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font24BlackBold = GoogleFonts.dmSans(
      textStyle: TextStyle(
    fontSize: 24.sp,
    color: ColorsManager.mainBlack,
    fontWeight: FontWeightHelper.bold,
  ));
  static TextStyle font14GreyRegular = GoogleFonts.dmSans(
      textStyle: TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.grey,
    fontWeight: FontWeightHelper.regular,
  ));
  static TextStyle font19WhiteBold = GoogleFonts.dmSans(
      textStyle: TextStyle(
    fontSize: 19.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.bold,
  ));
  static TextStyle font16WhiteBold = GoogleFonts.dmSans(textStyle: TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.bold,
  ));
}
