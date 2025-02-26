import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talent_space_test/core/theming/app_colors.dart';
import 'package:talent_space_test/core/theming/font_weight_helper.dart';


class TextStyles {
  static TextStyle font20BlackBold = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.bold,
      color: AppColors.blackColor);
  static TextStyle font18BlackMedium = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeightHelper.medium,
      color: AppColors.blackColor);
  static TextStyle font16GrayishBlueVeryDarkRegular = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.grayishBlueVeryDarkColor);
  static TextStyle font14WhiteMedium = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      color: AppColors.whiteColor);
  static TextStyle font16BlackMedium = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.medium,
      color: AppColors.blackColor);
  static TextStyle font18BlueMedium = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeightHelper.medium,
      color: AppColors.blueColor);
  static TextStyle font16BlueRegular = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.blueColor);
  static TextStyle font22BlueSemiBold = TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: AppColors.blueColor);
}
