import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talent_space_test/core/helpers/spacing.dart';
import 'package:talent_space_test/core/theming/text_styles.dart';
import 'package:talent_space_test/features/auth/Presentation/widgets/arrow_back_button.dart';
import 'package:talent_space_test/features/auth/Presentation/widgets/email_input.dart';
import 'package:talent_space_test/features/auth/Presentation/widgets/name_input.dart';
import 'package:talent_space_test/features/auth/Presentation/widgets/password_input.dart';
import 'package:talent_space_test/features/auth/Presentation/widgets/sign_in_button.dart';
import 'package:talent_space_test/features/auth/Presentation/widgets/social_login_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordObscureText = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.h),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ArrowBackButton(),
                  Text('إنشاء حساب', style: TextStyles.font22BlueSemiBold),
                  verticalSpace(34),
                  NameInput(nameContrller: nameController),
                  verticalSpace(32),
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
                      buttonText: 'إنشاء الحساب',
                      onPressed: () {
                        final name = nameController.text;
                        final email = emailController.text;
                        final password = passwordController.text;
                        if (formKey.currentState!.validate()) {
                          print(name);
                          print(email);
                          print(password);
                        }
                      }),
                  SocialLoginSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
