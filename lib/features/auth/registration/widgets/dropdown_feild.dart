import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class DropdownWidget extends StatelessWidget {
  final String label;
  final List<String> items;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const DropdownWidget({
    super.key,
    required this.label,
    required this.items,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: controller.text.isNotEmpty ? controller.text : null,
     decoration: InputDecoration(
        labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryRed, width: 1.5),
            borderRadius: BorderRadius.circular(5),
          ),
         
        ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
         ))
          .toList(),
      onChanged: (value) {
        controller.text = value ?? '';
      },
      validator: validator ??
      (value) => value == null || value.isEmpty ? '$label is required' : null,
      menuMaxHeight: 300, 
      borderRadius: BorderRadius.circular(5), 
    );
  }
}
