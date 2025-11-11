import 'package:flutter/material.dart';

import '../constants/appColors.dart';
import '../styles/appStyles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
   this.suffixIcon,
    required this.controller,
    required this.isPassword,
    this.validator,
    this.inputKeyboardType,
  });
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType? inputKeyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors.primary,
      cursorWidth: 1,
      cursorErrorColor: Colors.red,
      cursorHeight: 17,
      validator: widget.validator,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.inputKeyboardType,
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
        errorStyle: AppStyles.white16W500.copyWith(color: Colors.white, fontSize: 10),
        hintText: widget.hintText,
        hintStyle: AppStyles.white16W500.copyWith(color: AppColors.primary),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                : widget.suffixIcon,
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.white, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.white, width: 1),
        ),
      ),
    );
  }
}
