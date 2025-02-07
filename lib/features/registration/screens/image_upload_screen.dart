import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inakal/common/widgets/bottom_navigation.dart';
import 'dart:io';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient.dart';
import 'package:inakal/features/registration/widgets/registration_loader.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  List<File?> images = List<File?>.filled(6, null);

  Future<void> pickImage(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        images[index] = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 30.0, right: 30.0),
              child: Column(
                children: [
                  const SizedBox(height: 42),
                  const RegistrationLoader(progress: 3),
                  const SizedBox(height: 20),
                  const Text(
                    "Upload your photo",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryRed,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "We'd love to see you. Upload a photo for your dating journey.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2, child: ImageSlot(0)),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: ImageSlot(3)),
                              const SizedBox(height: 8),
                              Expanded(child: ImageSlot(4)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(text: "Continue", onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavBarScreen(),
                    ),
                  );
                },),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.42),
                ],
              ),
            ),
          ),
          
           LightPinkGradient(),
        ],
      ),
    );
  }

  Widget ImageSlot(int index) {
    return GestureDetector(
      onTap: () => pickImage(index),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: images[index] != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Image.file(
                      images[index]!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      right: 8,
                      bottom: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : DottedBorder(
                color: Colors.grey,
                strokeWidth: 2,
                dashPattern: const [6, 4],
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, size: 40, color: Colors.grey),
                      SizedBox(height: 10),
                      Text(
                        "Add Photo",
                        style: TextStyle(color: AppColors.grey),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
