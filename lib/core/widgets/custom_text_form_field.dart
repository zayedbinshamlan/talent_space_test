import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talent_space_test/core/theming/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final double? width;
  final double? height;
  final bool? isObscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String?)? validator;
  final Function(String)? onChanged;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final BoxConstraints? prefixIconConstraints;
  final TextAlign? textAlign;
  final Function(String)? onFieldSubmitted;
  final EdgeInsetsGeometry? margin;
  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.inputTextStyle,
      this.hintStyle,
      this.hintText,
      this.isObscureText,
      this.prefixIcon,
      this.backgroundColor,
      this.controller,
      this.validator,
      this.keyboardType,
      this.onChanged,
      this.width,
      this.prefixIconConstraints,
      this.height,
      this.maxLength,
      this.inputFormatters,
      this.textAlign,
      this.onFieldSubmitted,
      this.suffixIcon,
      this.focusNode,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          textAlign: textAlign ?? TextAlign.start,
          textInputAction: TextInputAction.done,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xffDDDDDD))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                      width: Theme.of(context).brightness == Brightness.light
                          ? 1.w
                          : 0.25.w,
                      color: const Color(0xffDDDDDD))),
              errorBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: const BorderSide(color: Colors.red)),
              // hintStyle: hintStyle ?? TextStyles.font14LightGreyRegular,
              hintText: hintText,
              hintStyle: hintStyle,
              fillColor: backgroundColor ?? Color(0xffffffff),
              // errorStyle: TextStyles.font13lighterGreenSemiBold,
              filled: true,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              prefixIconConstraints: prefixIconConstraints),
          cursorColor: AppColors.blackColor,
          cursorWidth: 1.w,
          cursorHeight: 16.h,
          obscureText: isObscureText ?? false,
          style: Theme.of(context).textTheme.titleMedium,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },
        ),
      ),
    );
  }
}
