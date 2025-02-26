import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:talent_space_test/core/theming/text_styles.dart';
import 'package:talent_space_test/core/widgets/custom_button.dart';

class SignInButton extends StatelessWidget {
  final String? buttonText;
  final Function() onPressed;
  const SignInButton({super.key, this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonText: buttonText ?? 'تسجيل الدخول',
      textStyle: TextStyles.font14WhiteMedium.copyWith(fontSize: 16.sp),
      onPressed: onPressed,
    );
  }
}
