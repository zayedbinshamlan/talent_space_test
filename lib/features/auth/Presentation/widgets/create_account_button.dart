import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talent_space_test/core/helpers/extensions.dart';
import 'package:talent_space_test/core/routing/routes.dart';
import 'package:talent_space_test/core/theming/app_colors.dart';
import 'package:talent_space_test/core/theming/text_styles.dart';
import 'package:talent_space_test/core/widgets/custom_button.dart';


class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonText: 'إنشاء حساب',
      textStyle: TextStyles.font14WhiteMedium
          .copyWith(fontSize: 16.sp, color: AppColors.praimryOrangeColor),
      onPressed: () {
        context.pushNamed(Routes.signUpScreen);
      },
      backgroundColor: AppColors.backgroundColor,
      borderColor: AppColors.praimryOrangeColor,
    );
  }
}
