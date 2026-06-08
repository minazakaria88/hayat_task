import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.readOnly,
    required this.hintText,
    this.keyboardType,
    this.onChanged,
    this.maxLines,
    this.maxLength,
    this.isObscureText = false,
    this.enabled = true,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.inputFormatters,
    this.onTap,
    this.autofillHints,
    this.textInputAction,
    this.onFieldSubmitted,
  });
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Function(String?)? onChanged;
  final VoidCallback? onTap;
  final bool? readOnly;
  final int? maxLines;
  final int? maxLength;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final Function(String?)? onFieldSubmitted;

  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      //enableInteractiveSelection: ,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      onChanged: onChanged,
      autofillHints: autofillHints,
      onTapOutside: (final event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      keyboardType: keyboardType,
      textInputAction:
          textInputAction ??
          (maxLines == 1 || maxLines == null
              ? TextInputAction.next
              : TextInputAction.newline),
      readOnly: readOnly ?? false,
      maxLines: isObscureText ? 1 : (maxLines ?? 1),
      maxLength: maxLength,
      enabled: enabled,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        counterText: '',
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
        focusedBorder:
            focusedBorder ??
            const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.3),
            ),
        enabledBorder:
            enabledBorder ??
            const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: AppColors.secondaryTextColor,
                width: 1.3,
              ),
            ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.red, width: 1.3),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.red, width: 1.3),
        ),
        helperMaxLines: 1,
        hintMaxLines: 1,
        hintStyle: hintStyle,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIcon != null
            ? const BoxConstraints(minWidth: 48, minHeight: 48)
            : null,
        fillColor: backgroundColor ?? Colors.white,
        filled: true,
      ),
      obscureText: isObscureText,
      obscuringCharacter: '*',
      style: inputTextStyle,
      validator: (final value) {
        return validator(value);
      },
    );
  }
}
