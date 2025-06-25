import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/filter_users/widgets/filter_dropdown.dart';

class FilteringScreen extends StatefulWidget {
  const FilteringScreen({super.key});

  @override
  State<FilteringScreen> createState() => _FilteringScreenState();
}

class _FilteringScreenState extends State<FilteringScreen> {
  String? selectedReligion;
  String? selectedCaste;
  TextEditingController religionController = TextEditingController();
  TextEditingController casteController = TextEditingController();
  TextEditingController subcasteController = TextEditingController();
  DropdownModel? dropdownModel;
  bool _isLoading = true;

  Future<void> _loadDropdownOptions() async {
    await EditProfileService()
        .getDropdownOptions(context: context)
        .then((value) {
      setState(() {
        dropdownModel = value;
      });
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _loadDropdownOptions();
    super.initState();
  }

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
              _isLoading
              ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Center(child: CircularProgressIndicator()))
              : Column(
                children: [
                  FilterDropdown(
                      label: "Religion",
                      items: dropdownModel!.religions!.map((item) => item.name ?? "").toList(),
                      valueController: religionController,
                      onChanged: (value) {
                        setState(() {
                          selectedReligion = value;
                        });
                      }),
                  const SizedBox(height: 10),
                  FilterDropdown(
                      label: "Caste",
                      items: ["Hindu", "Christian", "Muslim"],
                      valueController: casteController,
                      onChanged: (value) {
                        setState(() {
                          selectedCaste = value;
                        });
                      })
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
