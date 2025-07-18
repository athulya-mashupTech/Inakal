import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Subscription Plans",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                          "Basic features for entry-level users to explore the platform"),
                      SizedBox(height: 10),
                      ...List.generate(
                          15,
                          (index) =>
                              _featureRowBuilder("Access to  Normal Profiles Access to  Normal Profiles Access to  Normal Profiles"))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: _subscriptionCard(
                            "title", "price", "saver", "description")),
                    SizedBox(width: 10),
                    Expanded(
                        child: _subscriptionCard(
                            "title", "price", "saver", "description"))
                  ],
                ),
                SizedBox(height: 10),
                _subscriptionCard("title", "price", "saver", "description")
              ],
            ),
            SizedBox(height: 15),
            CustomButton(text: "Subscribe", onPressed: null),
            SizedBox(height: 20),
          ],
        ),
      )),
    );
  }

  Widget _featureRowBuilder(String feature) {
    return Row(
      children: [
        Icon(Icons.check, color: AppColors.primaryRed),
        SizedBox(width: 5),
        Text(feature)
      ],
    );
  }

  Widget _subscriptionCard(
      String title, String price, String saver, String description) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: BoxBorder.all(width: 2, color: AppColors.primaryRed)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Silver Membership"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("₹599.0",
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primaryRed,
                            fontWeight: FontWeight.bold,
                            height: 1)),
                    Icon(
                      Icons.diamond_rounded,
                      size: 18,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25,
              child: Column(
                children: [
                  Text(
                    "Save ₹51.00",
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
            Text(
              "Basic Plan with limited features",
            )
          ],
        ),
      ),
    );
  }
}
