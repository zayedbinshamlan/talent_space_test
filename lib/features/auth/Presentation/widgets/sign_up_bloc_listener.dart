
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:talent_space_test/core/helpers/extensions.dart';
import 'package:talent_space_test/core/routing/routes.dart';
import 'package:talent_space_test/core/theming/app_colors.dart';
import 'package:talent_space_test/core/theming/text_styles.dart';
import 'package:talent_space_test/features/auth/Presentation/cubit/auth_cubit.dart';
import 'package:talent_space_test/features/auth/Presentation/cubit/auth_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                  child: SpinKitWave(
                      color: AppColors.praimryOrangeColor, size: 30.0)),
            );
          } else if (state is AuthLoaded) {
            context.pushNamedAndRemoveUntil(Routes.homeScreen,
                predicate: (route) => false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("تم إرسال رابط التحقق إلى بريدك الإلكتروني")),
            );
          } else if (state is AuthError) {
            setupErrorState(context, 'تأكد من ملْ كل الحقول');
          }
        },
        child: const SizedBox.shrink());
  }

  void setupErrorState(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        backgroundColor: AppColors.backgroundColor,
        content: Text(error,
            textAlign: TextAlign.end, style: TextStyles.font16BlackMedium),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('فهمت'))
        ],
      ),
    );
  }
}
