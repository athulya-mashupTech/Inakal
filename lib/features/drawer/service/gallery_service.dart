import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/drawer/model/gallery_images_model.dart';

class GalleryService {
  final AuthController authController = Get.find();

  // Get all gallery images from server
  Future<GalleryImagesModel?> getGalleryImages(BuildContext context) async {
    try {
      final response =
          await _sendPostRequest(url: galleryImagesUrl, fields: {});

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        print("Message ${jsonResponse["message"]}");
        final galleryModel = GalleryImagesModel.fromJson(jsonResponse);

        if (galleryModel.type == "success") {
          print(galleryModel.gallery?.length);
          return galleryModel;
        } else {
          print("Error: ${galleryModel.message}");
          return GalleryImagesModel(
            type: "error",
            message: galleryModel.message,
            gallery: [],
          );
        }
      } else {
        print("Error: ${response.statusCode}");
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
          _showSnackbar(context, jsonResponse["message"] ?? "");
        return GalleryImagesModel(
            type: "error",
            message: jsonResponse["message"],
            gallery: [],
          );
      }
    } catch (e) {
      print("Error: $e");
      return null;
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
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
