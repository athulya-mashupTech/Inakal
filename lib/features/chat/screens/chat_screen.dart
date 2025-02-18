import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inakal/constants/app_constants.dart';
import 'dart:io';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty || _selectedImage != null) {
      setState(() {
        _messages.insert(0, {
          'text': _controller.text.trim().isNotEmpty ? _controller.text.trim() : null,
          'image': _selectedImage,
        });
      });
      _controller.clear();
      _selectedImage = null;
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Screen')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (message['text'] != null)
                          Text(
                            message['text'],
                            style: TextStyle(color: Colors.white),
                          ),
                        if (message['image'] != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Image.file(message['image'], width: 200),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (_selectedImage != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(_selectedImage!, height: 100),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.photo, color: AppColors.primaryRed),
                  onPressed: _pickImage,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: AppColors.primaryRed),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
