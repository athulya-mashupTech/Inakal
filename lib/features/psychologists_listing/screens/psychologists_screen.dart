import 'package:flutter/material.dart';

class PsychologistsScreen extends StatefulWidget {
  const PsychologistsScreen({super.key});

  @override
  State<PsychologistsScreen> createState() => _PsychologistsScreenState();
}

class _PsychologistsScreenState extends State<PsychologistsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Psychologist Page"),
      ),
    );
  }
}