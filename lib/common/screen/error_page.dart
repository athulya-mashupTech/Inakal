import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            Image.asset("assets/vectors/error_inakal.png"),
            Text("Oops! Something went wrong!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(
                "Brace yourself till we get the error fixed. You may also refresh the page or try again later"),
          ],
        ),
      ),
    );
  }
}
