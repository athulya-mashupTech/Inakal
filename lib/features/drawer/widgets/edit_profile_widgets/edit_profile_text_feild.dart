import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class EditProfileTextFeild extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  int? maxlines = 1;
  final String? errorText;
  final TextInputType? inputType;

  EditProfileTextFeild(
      {required this.label,
      required this.controller,
      this.maxlines,
      this.inputType,
      this.errorText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines == 3 ? null : 1,
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        fillColor: AppColors.white,
        errorText: (errorText == "" || errorText == null) ? null : "$label $errorText",
        labelStyle: TextStyle(color: AppColors.grey, fontSize: 14),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.primaryRed),
        ),
      ),
    );
  }
}
