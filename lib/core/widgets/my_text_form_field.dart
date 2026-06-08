import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    this.suffixIcon,
    required this.validator,
    this.prefixIcon,
    this.textInputType,
    this.onChange,
    this.isObscureText=false
  });
  final TextEditingController controller;
  final String hint;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final Function(String)? onChange;
  final bool isObscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      onChanged: onChange,
      obscureText: isObscureText,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
