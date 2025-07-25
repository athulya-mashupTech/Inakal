import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/service/gallery_service.dart';
import 'package:inakal/features/drawer/widgets/common/gallery_image_card.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<File?> images = List<File?>.filled(6, null);
  bool isLoading = false;

  final userController = Get.find<UserDataController>();

  final List<String> localImages = [
    "assets/vectors/harsha1.jpg",
    "assets/vectors/harsha2.jpg",
    "assets/vectors/harsha3.jpg",
    "assets/vectors/harsha4.jpg",
    "assets/vectors/harsha1.jpg"
  ];

  Future<void> pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        isLoading = true;
      });
      await GalleryService()
          .uploadGalleryImage(filePath: pickedFile.path, context: context)
          .then((value) async {
        // await userController.updateProfilePicture(value!.url ?? "");
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  void initState() {
    final userController = Get.find<UserDataController>();
    print(userController.galleryImages.value.gallery?.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
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
          SafeArea(
            child: SingleChildScrollView(
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
                      onTap: () => pickImage(context),
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
                    isLoading
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : (userController.galleryImages.value.gallery?.length ==
                                0 || userController.galleryImages.value.gallery == null )
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  child: Column(
                                    children: [
                                      Icon(Icons.broken_image_rounded, size: 30, color: AppColors.primaryRed,),
                                      Text(
                                        "No Images Uploaded",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.black),
                                      ),
                                      Text(
                                          "You have not uploaded any images yet!"),
                                    ],
                                  ),
                                ),
                              )
                            : Obx(() => GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: 1.3,
                                  ),
                                  itemCount: userController.galleryImages.value
                                          .gallery?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        GalleryImageCard(
                                            image: userController
                                                    .galleryImages
                                                    .value
                                                    .gallery?[index]
                                                    .image ??
                                                "",
                                            isPublic: userController
                                                    .galleryImages
                                                    .value
                                                    .gallery?[index]
                                                    .isPublic ??
                                                "",
                                            onDelete: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: Text("Delete Image"),
                                                  content: Text(
                                                      "Are you sure you want to delete this image?"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: Text("Cancel"),
                                                    ),
                                                    TextButton(
                                                      onPressed: () async {
                                                        setState(() {
                                                          isLoading = true;
                                                        });
                                                        Navigator.pop(
                                                            context); 
                                                        await GalleryService()
                                                            .deleteGalleryImage(
                                                                context,
                                                                userController
                                                                        .galleryImages
                                                                        .value
                                                                        .gallery?[
                                                                            index]
                                                                        .id ??
                                                                    "")
                                                            .then((_) {
                                                          setState(() {
                                                            isLoading = false;
                                                          });
                                                        });// Close dialog after deleting
                                                      },
                                                      child: Text("Delete",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.red)),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ],
                                    );
                                  },
                                )),
                    // const SizedBox(height: 16),
                    // CustomButton(text: "Save Changes")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
