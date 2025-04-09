import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/widgets/gallery_image_card.dart';
import 'package:inakal/features/profile/widgets/Image_card.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<File?> images = List<File?>.filled(6, null);

  final List<String> localImages = [
    "assets/vectors/harsha1.jpg",
    "assets/vectors/harsha2.jpg",
    "assets/vectors/harsha3.jpg",
    "assets/vectors/harsha4.jpg",
    "assets/vectors/harsha1.jpg"
  ];

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        localImages.add("assets/vectors/harsha1.jpg");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: -100,
              child: Image.asset(
                'assets/vectors/dotted_design1.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  gradient: AppColors.pinkWhiteGradient,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        BackButton(),
                        SizedBox(width: 10),
                        const Text(
                          'Gallery Page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
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
                    GestureDetector(
                      onTap: () => pickImage(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.grey.withAlpha(10),
                        ),
                        child: DottedBorder(
                          color: AppColors.primaryRed,
                          strokeWidth: 2,
                          dashPattern: const [6, 4],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Card(
                                      shape: CircleBorder(),
                                      color: AppColors.primaryRed,
                                      child: Icon(Icons.add,
                                          size: 35, color: AppColors.white)),
                                  SizedBox(height: 10),
                                  Text(
                                    "Drop images to upload",
                                    style: TextStyle(
                                        color: AppColors.grey, fontSize: 16),
                                  ),
                                  Text(
                                    "(.jpg, .jpeg, .png)",
                                    style: TextStyle(
                                        color: AppColors.grey, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.3,
                      ),
                      itemCount: localImages.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            GalleryImageCard(
                                image: localImages[index],
                                onDelete: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text("Delete Image"),
                                      content: Text(
                                          "Are you sure you want to delete this image?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              localImages.removeAt(index);
                                            });
                                            Navigator.pop(
                                                context); // Close dialog after deleting
                                          },
                                          child: Text("Delete",
                                              style:
                                                  TextStyle(color: Colors.red)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomButton(text: "Save Changes")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
