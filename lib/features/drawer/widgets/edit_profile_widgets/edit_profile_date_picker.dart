import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class EditProfileDatePicker extends StatelessWidget {
  String label;
  TextEditingController controller;
  EditProfileDatePicker(
      {required this.label, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      onTap: () async {
        await _selectDate(context, controller, label);
      },
    );
  }

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
    String label,
  ) async {
    final DateTime now = DateTime.now();
    final DateTime initialDate =
        DateTime(now.year - 18, now.month, now.day);
    final DateTime firstDate = DateTime(1900);
    final DateTime lastDate = now;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      helpText: 'Select $label',
    );

    if (picked != null) {
      controller.text = "${picked.toLocal()}".split(' ')[0]; // yyyy-MM-dd
    }
  }
}
