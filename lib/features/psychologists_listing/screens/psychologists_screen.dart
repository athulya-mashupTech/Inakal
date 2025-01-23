import 'package:flutter/material.dart';

class PsychologistsScreen extends StatefulWidget {
  const PsychologistsScreen({super.key});

  @override
  State<PsychologistsScreen> createState() => _PsychologistsScreenState();
}

class _PsychologistsScreenState extends State<PsychologistsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Psychologist Page"),
    );
  }
}