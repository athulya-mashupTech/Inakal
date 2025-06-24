import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:inakal/constants/app_constants.dart';

class EditDropdownWidget extends StatefulWidget {
  final TextEditingController controller;
  final List<String> values;
  final void Function(String)? onChanged;
  final String hintText;

  const EditDropdownWidget({
    super.key,
    required this.controller,
    required this.values,
    this.onChanged,
    this.hintText = "Select an option",
  });

  @override
  State<EditDropdownWidget> createState() => _EditDropdownWidgetState();
}

class _EditDropdownWidgetState extends State<EditDropdownWidget> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue =
        widget.controller.text.isNotEmpty ? widget.controller.text : null;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        alignment: Alignment.centerRight,
        value: selectedValue?.isNotEmpty == true ? selectedValue : null,
        hint: Text(
          widget.hintText,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.grey,
            fontStyle: FontStyle.italic,
          ),
        ),
        icon: const Iconify(
          Ic.round_arrow_drop_down,
          color: AppColors.primaryRed,
          size: 30,
        ),
        items: widget.values.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            widget.onChanged?.call(newValue);
            setState(() {
              selectedValue = newValue;
              widget.controller.text = newValue;
            });
          }
        },
      ),
    );
  }
}
