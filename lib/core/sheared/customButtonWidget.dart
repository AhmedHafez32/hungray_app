import 'package:flutter/material.dart';

import '../constants/appColors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color? textColor;
  final void Function() onPress;
  const CustomButtonWidget({
    super.key,
    required this.buttonText,
    this.buttonColor,
    this.width,
    this.height,
    this.borderRadius,
    this.fontSize,
    this.textColor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        ),
        minimumSize: Size(width ?? double.infinity, height ?? 56),
        //fixedSize: Size(width ?? double.infinity, height ?? 56),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor ?? AppColors.primary,
          fontSize: fontSize ?? 16,
        ),
      ),
    );
  }
}
