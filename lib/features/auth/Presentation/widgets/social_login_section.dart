import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:talent_space_test/core/theming/app_colors.dart';
import 'package:talent_space_test/features/auth/Presentation/cubit/auth_cubit.dart';
import 'package:talent_space_test/features/auth/Presentation/widgets/social_login_button.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0.h),
      child: SocialLoginButton(onTap: () {
        context.read<AuthCubit>().signInWithGoogle();
      }, 'متابعة مع جوجل', AppColors.googleButtonColor, 16.0.w,
          iconWidth: 25.w),
    );
  }
}
