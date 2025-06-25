import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:inakal/features/filter_users/widgets/filter_dropdown.dart';

class FilteringScreen extends StatefulWidget {
  const FilteringScreen({super.key});

  @override
  State<FilteringScreen> createState() => _FilteringScreenState();
}

class _FilteringScreenState extends State<FilteringScreen> {
  String? selectedReligion;
  String? selectedCaste;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Iconify(Mdi.instant_mix),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Filter")
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
              const SizedBox(height: 10),
              FilterDropdown(
                  label: "Religon",
                  items: ["Hindu", "Christian", "Muslim"],
                  onChanged: (value) {
                      setState(() {
                        selectedReligion = value;
                      });
                    }),

                    FilterDropdown(
                  label: "Caste",
                  items: ["Hindu", "Christian", "Muslim"],
                  onChanged: (value) {
                      setState(() {
                        selectedCaste = value;
                      });
                    })
            ],
          ),
        ),
      ),
    ));
  }
}
