import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class EditProfileTextFeild extends StatelessWidget {
  String label;
  TextEditingController controller;

   EditProfileTextFeild({
    required this.label,
    required this.controller,
    super.key});

  @override
  Widget build(BuildContext context) {
     return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        fillColor: AppColors.white,
        labelStyle: TextStyle(color: AppColors.grey,fontSize: 14),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.primaryRed),
        ),
      ),
    );
  }
}
