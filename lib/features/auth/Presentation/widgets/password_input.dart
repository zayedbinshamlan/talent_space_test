import 'package:flutter/material.dart';
import 'package:talent_space_test/core/helpers/spacing.dart';
import 'package:talent_space_test/core/theming/text_styles.dart';
import 'package:talent_space_test/core/widgets/custom_text_form_field.dart';

class PasswordInput extends StatelessWidget {
  final bool isPasswordObscureText;
  final VoidCallback onTogglePasswordVisibility;
  final TextEditingController passwordContrller;
  const PasswordInput(
      this.isPasswordObscureText, this.onTogglePasswordVisibility,
      {super.key, required this.passwordContrller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('كلمة المرور', style: TextStyles.font16BlackMedium),
        verticalSpace(5),
        AppTextFormField(
          controller: passwordContrller,
          isObscureText: isPasswordObscureText,
          suffixIcon: GestureDetector(
            onTap: onTogglePasswordVisibility,
            child: Icon(isPasswordObscureText
                ? Icons.visibility_off
                : Icons.visibility),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'الحقل مطلوب';
            }
            return null;
          },
        ),
      ],
    );
  }
}
