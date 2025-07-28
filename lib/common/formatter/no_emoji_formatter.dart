import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoEmojiFormatter extends TextInputFormatter {
  // Regex to match only normal printable characters (A-Z, a-z, 0-9, symbols, whitespace)
  final RegExp _validChars = RegExp(r"^[\u0020-\u007E]+$"); // ASCII range (space to ~)

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Filter the input to only include valid characters
    final filtered = newValue.text.characters
        .where((char) => _validChars.hasMatch(char))
        .join();

    return TextEditingValue(
      text: filtered,
      selection: TextSelection.collapsed(offset: filtered.length),
    );
  }
}
