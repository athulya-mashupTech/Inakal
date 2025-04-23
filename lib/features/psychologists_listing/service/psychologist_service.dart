import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/psychologists_listing/model/book_appointment_model.dart';
import 'package:inakal/features/psychologists_listing/model/psychologist_model.dart';

class PsychologistService {

  final AuthController authController = Get.find();
  
  // Fetch All Doctors
  Future<PsychologistModel?> getAllDoctors({
    required BuildContext context
    }) async {
    try {
      final response = await _sendGetRequest(
        url: allDoctorsUrl,
      );

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final psychologistModel = PsychologistModel.fromJson(jsonResponse);
        if (psychologistModel.type == "success") {
          _showSnackbar(context, "Successfuly fetched doctors");
          return psychologistModel;
        } else {
          _showSnackbar(
              context, psychologistModel.type ?? "Error fetching doctors");
          return null;
        }
      }
    } catch (e) {
      print("Error fetching doctors: $e");
      return null;
    }
  }

  // Book Appointment
  Future<BookAppointmentModel> bookAppointment(
    BuildContext context
    ) async {
    try {
      final response =
          await _sendPostRequest(url: bookAppointmentUrl, fields: {});

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final bookAppointmentModel = BookAppointmentModel.fromJson(jsonResponse);

        if (bookAppointmentModel.type == "success") {
          _showSnackbar(
              context,
              bookAppointmentModel.message ?? "Appointment booked successfully");
        }
        return bookAppointmentModel;
      } else {
        return BookAppointmentModel(
          message: "Error booking appointment",
          type: "danger",
        );
      }
    } catch (e) {
      print("Error booking appointment: $e");
      return BookAppointmentModel(
        message: "Error booking appointment",
        type: "danger",
      );
    }
  }

  // Helper method to send POST request
  Future<http.StreamedResponse> _sendPostRequest({
    required String url,
    required Map<String, String> fields,
  }) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(fields);
    final token = authController.token.value; // Get the token from AuthController
    final headers = {
      'Authorization': 'Bearer $token',
    };
    request.headers.addAll(headers);
    return await request.send();
  }

  // Helper method to send Get request
  Future<http.StreamedResponse> _sendGetRequest({
    required String url,
  }) async {
    final request = http.MultipartRequest('GET', Uri.parse(url));
    final token = authController.token.value; // Get the token from AuthController
    final headers = {
      'Authorization': 'Bearer $token',
    };
    request.headers.addAll(headers);
    return await request.send();
  }

  // Method to show Snackbar
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
