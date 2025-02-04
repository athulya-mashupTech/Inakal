import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

// class TextFieldWidget extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final TextInputType? keyboardType;
//   final Widget? suffixIcon;
//   final VoidCallback? onTap;

//   const TextFieldWidget({
//     required this.controller,
//     required this.hintText,
//     this.keyboardType,
//     this.suffixIcon,
//     this.onTap,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: TextField(
//         controller: controller,
//         keyboardType: keyboardType,
//         decoration: InputDecoration(
//           hintText: hintText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: AppColors.primaryRed, width: 1.5),
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           suffixIcon: suffixIcon,
//         ),
//         onTap: onTap,
//       ),
//     );
//   }
// }
class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final bool obscureText;
  final String? Function(String?)? validator;

  const TextFieldWidget({
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.suffixIcon,
    this.onTap,
    this.obscureText = false,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryRed, width: 1.5),
            borderRadius: BorderRadius.circular(30.0),
          ),
          suffixIcon: suffixIcon,
        ),
        onTap: onTap,
        validator: validator,
      ),
    );
  }
}
