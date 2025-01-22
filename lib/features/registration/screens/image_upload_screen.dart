import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageUploadScreen extends StatefulWidget {
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
      appBar: AppBar(
        title: const Text("Upload Your Photo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            const SizedBox(height: 36), 
            const Text(
              "We'd love to see you. Upload a photo for your dating journey.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16), // Reduced the height from 20 to 16
            Expanded(
              flex: 3, // Adjust the weight for the upper row
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Distribute space evenly
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align content to the top
                children: [
                  Expanded(flex: 2, child: ImageSlot(0)),
                  const SizedBox(width: 8), // Reduced width from 10 to 8
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .start, // Align items to the top of the column
                      crossAxisAlignment: CrossAxisAlignment
                          .stretch, // Ensure the column stretches to fill the available width
                      children: [
                        Expanded(child: ImageSlot(3)),
                        const SizedBox(
                            height: 8), // Reduced height from 10 to 8
                        Expanded(child: ImageSlot(4)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // const SizedBox(height: 8), // Reduced height from 10 to 8

            Expanded(
              flex: 2, // Adjust the weight for the lower row
              child: Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1, // Enforce square shape
                      child: ImageSlot(1),
                    ),
                  ),
                  const SizedBox(width: 8), // Reduced width from 10 to 8
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1, // Enforce square shape
                      child: ImageSlot(2),
                    ),
                  ),
                  const SizedBox(width: 8), // Reduced width from 10 to 8
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1, // Enforce square shape
                      child: ImageSlot(5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Added a SizedBox to separate the button from the images
            ElevatedButton(
              onPressed: () {
                // Handle the continue button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget ImageSlot(int index) {
    return GestureDetector(
      onTap: () => pickImage(index),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200], // Placeholder background color
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
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : DottedBorder(
                color: Colors.grey,
                strokeWidth: 2,
                dashPattern: [6, 4],
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.add, size: 40, color: Colors.grey),
                      SizedBox(height: 10),
                      Text(
                        "Add Photo",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
