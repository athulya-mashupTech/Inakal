import 'package:flutter/material.dart';
import 'package:inakal/common/formatter/no_emoji_formatter.dart';
import 'package:inakal/constants/app_constants.dart';

class EditProfileTextFeild extends StatelessWidget {

  String label;
  TextEditingController controller;
  int? maxlines = 1;
  TextInputType? inputType;

  EditProfileTextFeild(
      {required this.label,
      required this.controller,
      this.maxlines,
      this.inputType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines:  maxlines == 3 ? null : 1,
      keyboardType: inputType,
       inputFormatters: [NoEmojiFormatter()],
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        fillColor: AppColors.white,
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
