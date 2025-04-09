import 'package:flutter/material.dart';

class EditableTextWidget extends StatefulWidget {
  final TextEditingController controller;
  final bool? justify;

  const EditableTextWidget({
    super.key,
    required this.controller, this.justify, // Make controller required
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
        textAlign: widget.justify != null ? TextAlign.justify : TextAlign.end,
        decoration: null,
         minLines: 1,
        maxLines: null, // Allows the field to grow based on content
        keyboardType: TextInputType.multiline,
        onSubmitted: (value) {
          setState(() {
            widget.controller.text = value;
          });
        },
        style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis, fontSize: 18),
      ),
    );
  }
}
