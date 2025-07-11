import 'package:intl/intl.dart';

class Functions {
  /// Method to calculate age from date of birth in 'yyyy-MM-dd' format
  static String calculateAge(String dateOfBirth) {
    // debugPrint("Date of Birth: $dateOfBirth");
    // Check for null or invalid date
    if (dateOfBirth == "" ||
        dateOfBirth.isEmpty ||
        dateOfBirth == '0000-00-00') {
      return 'NA';
    }

    // Parse the string into a DateTime object
    final DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(dateOfBirth);
    final DateTime today = DateTime.now();
    int age = today.year - parsedDate.year;

    // Adjust age if the birthday hasn't occurred yet this year
    if (today.month < parsedDate.month ||
        (today.month == parsedDate.month && today.day < parsedDate.day)) {
      age--;
    }

    return age.toString();
  }
}
