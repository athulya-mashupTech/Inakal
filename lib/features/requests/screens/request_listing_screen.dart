import 'package:flutter/material.dart';

class RequestListingScreen extends StatefulWidget {
  const RequestListingScreen({super.key});

  @override
  State<RequestListingScreen> createState() => _RequestListingScreenState();
}

class _RequestListingScreenState extends State<RequestListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Requests Page"),
      ),
    );
  }
}