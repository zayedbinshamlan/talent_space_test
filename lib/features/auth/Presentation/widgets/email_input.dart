import 'package:flutter/material.dart';
import 'package:talent_space_test/core/helpers/spacing.dart';
import 'package:talent_space_test/core/theming/text_styles.dart';
import 'package:talent_space_test/core/widgets/custom_text_form_field.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController emailContrller;
  const EmailInput({super.key, required this.emailContrller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('البريد الإلكتروني', style: TextStyles.font16BlackMedium),
        verticalSpace(5),
        AppTextFormField(
          controller: emailContrller,
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
