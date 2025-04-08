import 'package:flutter/material.dart';

class EditableTextWidget extends StatefulWidget {
  final TextEditingController controller;

  const EditableTextWidget({
    super.key,
    required this.controller, // Make controller required
  });

  @override
  State<EditableTextWidget> createState() => _EditableTextWidgetState();
}

class _EditableTextWidgetState extends State<EditableTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        controller: widget.controller,
        textAlign: TextAlign.end,
        decoration: null,
        onSubmitted: (value) {
          setState(() {
            widget.controller.text = value;
          });
        },
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}