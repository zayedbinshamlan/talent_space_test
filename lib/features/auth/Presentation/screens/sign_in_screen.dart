import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talent_space_test/core/helpers/spacing.dart';
import 'package:talent_space_test/core/theming/text_styles.dart';
import 'package:talent_space_test/features/auth/Presentation/widgets/create_account_button.dart';
import 'package:talent_space_test/features/auth/Presentation/widgets/email_input.dart';
import 'package:talent_space_test/features/auth/Presentation/widgets/password_input.dart';
import 'package:talent_space_test/features/auth/Presentation/widgets/sign_in_button.dart';
import 'package:talent_space_test/features/auth/Presentation/widgets/social_login_section.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPasswordObscureText = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.h),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                verticalSpace(43),
                Text('تسجيل دخول', style: TextStyles.font22BlueSemiBold),
                verticalSpace(34),
                EmailInput(emailContrller: emailController),
                verticalSpace(32),
                PasswordInput(
                    passwordContrller: passwordController,
                    isPasswordObscureText, () {
                  setState(() {
                    isPasswordObscureText = !isPasswordObscureText;
                  });
                }),
                verticalSpace(40),
                SignInButton(
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    if (formKey.currentState!.validate()) {
                      print(email);
                      print(password);
                    }
                  },
                ),
                SocialLoginSection(),
                CreateAccountButton(),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
