import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/filter_users/model/filter_model.dart';
import 'package:inakal/features/home/widgets/user_card.dart';

class FilteredProfileScreen extends StatefulWidget {
  final FilterProfileModel responseModel;

  const FilteredProfileScreen(this.responseModel, {super.key});

  @override
  State<FilteredProfileScreen> createState() => _FilteredProfileScreenState();
}

class _FilteredProfileScreenState extends State<FilteredProfileScreen> {
  int count = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Iconify(Mdi.instant_mix),
                    SizedBox(width: 3),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Filtered ',
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          TextSpan(
                            text: 'Profiles',
                            style: TextStyle(
                              color: AppColors.primaryRed,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                    "Showing profiles out of ${widget.responseModel.totalRows ?? "0"} matches"),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10, // Spacing between columns
                        mainAxisSpacing: 10, // Spacing between rows
                        childAspectRatio: 1,
                      ),
                      itemCount: count,
                      itemBuilder: (context, index) => UserCard(
                          name: "Athulya Ajayakumar",
                          location: "Ernakulam",
                          dob: "2002-08-27",
                          image:
                              "https://etutor.s3.ap-south-1.amazonaws.com/users/avatar.png",
                          likedBy: "1",
                          clientId: "1")),
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: "See More",
                  // icon: Icons.keyboard_arrow_down_rounded,
                  onPressed: () {
                    setState(() {
                      count = count + 5;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
