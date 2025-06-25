import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:inakal/common/widgets/bottom_navigation.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/filter_users/widgets/filter_button.dart';
import 'package:inakal/features/home/model/filter_model.dart';
import 'package:inakal/features/home/screens/home_screen.dart';
import 'package:inakal/features/auth/registration/widgets/custom_hobbies.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues modalRangeValues = const RangeValues(80, 190);
  RangeValues modalRangeValuesAge = const RangeValues(18, 60);
  TextEditingController locationController = TextEditingController();
  final List<String> interests = [
    "Reading",
    "Photography",
    "Gaming",
    "Music",
    "Travel",
    "Painting",
    "Politics",
    "Charity",
    "Cooking",
    "Pets",
    "Sports",
    "Fashion",
    "Dance",
  ];

  final Set<String> selectedInterests = {};
  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else if (selectedInterests.length < 13) {
        selectedInterests.add(interest);
      }
    });
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child:
                    Text("ID", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              TextField(
                  decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: AppColors.primaryRed,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryRed, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1.5),
                ),
                hintText: 'Search by ID',
                hintStyle: const TextStyle(color: AppColors.grey, fontSize: 18),
                prefixIcon: const SizedBox(
                  width: 18,
                  child: Icon(Icons.search_rounded),
                ),
              )),
              const SizedBox(height: 10),
              FilterButton(
                text: "Search",
                onPressed: () {
                  final filterData = FilterModel(id: null);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(filterModel: filterData),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  SizedBox(width: 20),
                  Expanded(child: Divider()),
                  SizedBox(width: 10),
                  Text("or"),
                  SizedBox(width: 10),
                  Expanded(child: Divider()),
                  SizedBox(width: 20)
                ],
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Text("Location",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: AppColors.primaryRed,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primaryRed, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 1.5),
                    ),
                    hintText: 'Search prefered location',
                    hintStyle:
                        const TextStyle(color: AppColors.grey, fontSize: 18),
                  )),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Text("Height",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              RangeSlider(
                activeColor: AppColors.primaryRed,
                values: modalRangeValues,
                min: 80.0,
                max: 190.0,
                divisions: 30,
                labels: RangeLabels(
                  modalRangeValues.start.toString(),
                  modalRangeValues.end.toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    modalRangeValues = values;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("5'0\"", style: TextStyle(color: AppColors.grey)),
                    Text("8'0\"", style: TextStyle(color: AppColors.grey))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child:
                    Text("Age", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              RangeSlider(
                activeColor: AppColors.primaryRed,
                values: modalRangeValuesAge,
                min: 18,
                max: 60,
                divisions: 30,
                labels: RangeLabels(
                  modalRangeValuesAge.start.toString(),
                  modalRangeValuesAge.end.toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    modalRangeValuesAge = values;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("18", style: TextStyle(color: AppColors.grey)),
                    Text("60", style: TextStyle(color: AppColors.grey))
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Text("Interests",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: interests.map((interest) {
                    return InterestItem(
                      interest: interest,
                      isSelected: selectedInterests.contains(interest),
                      onTap: () => toggleInterest(interest),
                    );
                  }).toList(),
                ),
              ),
              CustomButton(
                text: "Apply filters",
                onPressed: () {
                  final filterData = FilterModel(
                    // Replace with the required positional argument
                    id: null,
                    location: locationController.text == ""
                        ? null
                        : locationController.text,
                    minHeight: modalRangeValues.start,
                    maxHeight: modalRangeValues.end,
                    minAge: modalRangeValuesAge.start.round(),
                    maxAge: modalRangeValuesAge.end.round(),
                    interests: selectedInterests,
                  );
                  Get.offAll(() => BottomNavBarScreen());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Filters applied')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
