
import 'package:flutter/material.dart';
import 'package:talent_space_test/core/helpers/spacing.dart';
import 'package:talent_space_test/core/theming/text_styles.dart';
import 'package:talent_space_test/core/widgets/custom_text_form_field.dart';


class NameInput extends StatelessWidget {
    final TextEditingController nameContrller;
  const NameInput({super.key, required this.nameContrller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('الاسم كامل', style: TextStyles.font16BlackMedium),
        verticalSpace(5),
        AppTextFormField(controller: nameContrller , validator: (value) {
            if (value!.isEmpty) {
              return 'الحقل مطلوب';
            }
            return null;
          },),
      ],
    );
  }
}