import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/home/widgets/filter_button.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues modalRangeValues = const RangeValues(5.0, 8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Iconify(Mdi.instant_mix),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Filter")
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.close))
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text("ID", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          TextField(
              decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: AppColors.primaryRed,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryRed, width: 1),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1.5),
            ),
            hintText: 'Search by ID',
            hintStyle: TextStyle(color: AppColors.grey, fontSize: 18),
            prefixIcon: Container(
              // padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.search_rounded),
              width: 18,
            ),
          )),
          SizedBox(height: 10),
          FilterButton(text: "Search"),
          SizedBox(height: 15),
          Row(
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
          SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:
                Text("Location", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          TextField(
              decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: AppColors.primaryRed,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryRed, width: 1),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1.5),
            ),
            hintText: 'Search prefered location',
            hintStyle: const TextStyle(color: AppColors.grey, fontSize: 18),
          )),
          SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text("Age", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          RangeSlider(
            activeColor: AppColors.primaryRed,
            values: modalRangeValues,
            min: 5.0,
            max: 8.0,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("5'0\"", style: TextStyle(color: AppColors.grey)),
                Text("8'0\"", style: TextStyle(color: AppColors.grey))
              ],
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    ));
  }
}
