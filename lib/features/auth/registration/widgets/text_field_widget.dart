import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool obscureText;
  final String? Function(String?)? validator;

  const TextFieldWidget({
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.obscureText = false,
    this.validator,
    super.key, this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        focusNode: focusNode,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.primaryRed, width: 1.5),
              borderRadius: BorderRadius.circular(30.0),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon),
        onTap: onTap,
        validator: validator,
      ),
    );
  }
}
