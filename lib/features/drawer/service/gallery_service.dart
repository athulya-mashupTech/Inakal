import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/drawer/model/delete_gallery_image_model.dart';
import 'package:inakal/features/drawer/model/gallery_image_upload_model.dart';
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
          final userController = Get.find<UserDataController>();
          userController.updateGalleryImages(galleryModel);
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

  Future<UploadGalleryImageModel?> uploadGalleryImage({
    required String filePath,
    required BuildContext context,
  }) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(updateGalleryImageUrl));

      request.files.add(await http.MultipartFile.fromPath('image', filePath));

      final token =
          authController.token.value; // Get the token from AuthController
      final headers = {
        'Authorization': 'Bearer $token',
      };
      request.headers.addAll(headers);

      final response = await request.send();

      if (response.statusCode == 200) {
        String responseData = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = jsonDecode(responseData);
        var uploadGalleryImageModel =
            UploadGalleryImageModel.fromJson(jsonResponse);
        if (uploadGalleryImageModel.uploaded == 1) {
          _showSnackbar(context, 'Image uploaded successfully');
          // String newImageUrl = uploadGalleryImageModel.url!;

          final galleryImages = await getGalleryImages(context);
          if (galleryImages?.type == "success") {
            final userController = Get.find<UserDataController>();
            print("Gallery Reset");
            userController.updateGalleryImages(
                galleryImages ?? GalleryImagesModel(gallery: []));
          }
        } else {
          _showSnackbar(context, "Failed to upload image");
        }
        return uploadGalleryImageModel;
      } else {
        print('Error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }

  Future<DeleteGalleryImageModel?> deleteGalleryImage(
      BuildContext context, String imageId) async {
    try {
      final response = await _sendPostRequest(
          url: deleteGalleryImageUrl, fields: {"image_id": imageId});

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final deleteGalleryImageModel =
            DeleteGalleryImageModel.fromJson(jsonResponse);

        if (deleteGalleryImageModel.type == "success") {
          _showSnackbar(context, deleteGalleryImageModel.message ?? "");
          await getGalleryImages(context);
          return deleteGalleryImageModel;
        } else {
          print("Error: ${deleteGalleryImageModel.message}");
          return DeleteGalleryImageModel();
        }
      } else {
        print("Error: ${response.statusCode}");
        return null;
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
    Get.snackbar(
      "Message",
      message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 1),
    );
  }
}
