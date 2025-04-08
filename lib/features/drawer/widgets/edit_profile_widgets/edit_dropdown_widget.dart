import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:inakal/constants/app_constants.dart';

class EditDropdownWidget extends StatefulWidget {
  final TextEditingController controller;
  final List<String> values;
  const EditDropdownWidget({super.key, required this.controller, required this.values});

  @override
  State<EditDropdownWidget> createState() => _EditDropdownWidgetState();
}

class _EditDropdownWidgetState extends State<EditDropdownWidget> {
  String selectedValue = "";

  @override
  void initState() {
    super.initState();
    selectedValue = widget.controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      icon: const Iconify(
        Ic.round_arrow_drop_down,
        color: AppColors.primaryRed,
        size: 30,
      ),
      items: widget.values.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            selectedValue = newValue;
          });
        }
      },
    );
  }
}
