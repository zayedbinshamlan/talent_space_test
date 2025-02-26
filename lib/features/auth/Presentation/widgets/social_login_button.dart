import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talent_space_test/core/theming/text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final double? padding;
  final double? iconWidth;
  final Function()? onTap;
  const SocialLoginButton(this.buttonText, this.buttonColor, this.padding,
      {super.key, this.iconWidth, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: buttonColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding!),
          child: Align(
            child: Text(
              buttonText,
              style: TextStyles.font14WhiteMedium.copyWith(fontSize: 16.sp),
            ),
          ),
        ),
      ),
    );
  }
}
