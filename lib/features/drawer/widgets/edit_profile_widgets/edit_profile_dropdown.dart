// import 'package:flutter/material.dart';
// import 'package:inakal/constants/app_constants.dart';

// class EditProfileDropdown extends StatelessWidget {
//   String label;
//   List<String> items;
//   ValueChanged<String?> onChanged;
//   String? selectedValue;

//   EditProfileDropdown(
//       {required this.label,
//       required this.items,
//       required this.onChanged,
//       this.selectedValue,
//       super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         labelText: label,
//         fillColor: AppColors.white,
//         labelStyle: TextStyle(color: AppColors.grey, fontSize: 14),
//         border: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10))),
//         focusedBorder: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           borderSide: BorderSide(color: AppColors.primaryRed),
//         ),
//       ),
//       items: items
//           .map((item) => DropdownMenuItem(
//                 value: item,
//                 child: Text(item),
//               ))
//           .toList(),
//       onChanged: onChanged,
//       value: selectedValue,
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class EditProfileDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? selectedValue;

  const EditProfileDropdown({
    required this.label,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        fillColor: AppColors.white,
        labelStyle: TextStyle(color: AppColors.grey, fontSize: 14),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.primaryRed),
        ),
      ),
      hint: Text(
        'Select $label',
        style: TextStyle(color: AppColors.grey),
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: onChanged,
      value: selectedValue == '' ? null : selectedValue,
    );
  }
}
