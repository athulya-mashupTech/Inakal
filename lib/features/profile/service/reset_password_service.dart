import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/profile/model/reset_password_model.dart';

class ResetPasswordService {
  final AuthController authController = Get.find();

  Future<ResetPasswordModel> resetPassword(String newpassword) async {
    try {
      final response = await _sendPostRequest(
          url: resetPasswordUrl, 
          fields: {
            "new_password": newpassword
            });

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseJson = json.decode(responseBody);
        final resetPasswordModel = ResetPasswordModel.fromJson(responseJson);

        return resetPasswordModel;
      }
      return ResetPasswordModel();
    } catch (e) {
      print(e);
      return ResetPasswordModel();
    }
  }

  // Helper method to send POST request
  Future<http.StreamedResponse> _sendPostRequest({
    required String url,
    required Map<String, String> fields,
  }) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(fields);
    final token =
        authController.token.value; // Get the token from AuthController
    final headers = {
      'Authorization': 'Bearer $token',
    };
    request.headers.addAll(headers);
    return await request.send();
  }

  // Method to show Snackbar
  // void _showSnackbar(BuildContext context, String message) {
  //   Get.snackbar(
  //     "Message",
  //     message,
  //     snackPosition: SnackPosition.TOP,
  //     duration: const Duration(seconds: 1),
  //   );
  // }
}
