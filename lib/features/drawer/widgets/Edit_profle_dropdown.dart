import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class EditProfleDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const EditProfleDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: DropdownButtonFormField<String>(
        value: controller.text.isNotEmpty ? controller.text : null,
       decoration: InputDecoration(
          labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryRed, width: 1.5),
              borderRadius: BorderRadius.circular(30.0),
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
        borderRadius: BorderRadius.circular(30.0), 
      ),
    );
  }
}
