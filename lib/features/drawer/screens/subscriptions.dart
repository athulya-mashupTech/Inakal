import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

// Track which subscription card is selected
int selectedsubscription = 0;

// Titles shown above the feature list
List<String> subscriptiontitles = [
  "Basic features for entry-level users to explore the platform",
  "Enhanced visibility and communication tools for serious matchmaking.",
  "Premium access with expert support, psychologist priority, and AI-powered suggestions"
];

// Features for each subscription plan
List<List<String>> subscriptionfeatures = [
  [
    "Access to Normal Profiles",
    "View limited contact details/month",
    "Add 1 photo to profile",
    "Daily match updates",
    "Add profile to favorites",
    "Age/location based suggestions",
    "View limited number of profiles/day"
  ],
  [
    "View more profiles/day",
    "Send unlimited interest requests",
    "Unlimited profile photo uploads",
    "Highlighted profile in search results",
    "Personalized profile recommendation",
    "Filter users based on basic details",
    "Early access to new features"
  ],
  [
    "Premium placement in search results",
    "Personalized suggestions from matchmaker",
    "Location-based elite match invites",
    "Priority review for profile approval",
    "Profile highlighted in top 10 search results always",
    "Early access to new app features",
    "Priority psychologist consultations",
  ]
];

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
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "Subscription Plans",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Feature list
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(subscriptiontitles[selectedsubscription]),
                        const SizedBox(height: 10),
                        ...List.generate(
                          subscriptionfeatures[selectedsubscription].length,
                          (index) => _featureRowBuilder(
                            subscriptionfeatures[selectedsubscription][index],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Subscription cards
              Column(
                children: [
                  Row(
                    children: [
                      // Silver
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedsubscription = 0;
                            });
                          },
                          child: _subscriptionCard(
                            index: 0,
                            title: "Silver Membership",
                            price: "599.0 Rs",
                            iconColor: AppColors.grey,
                            description: "Basic Plans with limited features",
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Gold
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedsubscription = 1;
                            });
                          },
                          child: _subscriptionCard(
                            index: 1,
                            title: "Gold Membership",
                            price: "1249.0 Rs",
                            iconColor: AppColors.goldenYellow,
                            description:
                                "Intermediate Plan with personalised matched",
                            saver: "Save ₹51.00",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Platinum
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedsubscription = 2;
                      });
                    },
                    child: _subscriptionCard(
                      index: 2,
                      title: "Platinum Membership",
                      price: "2499.0 Rs",
                      iconColor: AppColors.skyBlue,
                      description:
                          "Premium plan which offers utmost consultation and suggestion with certified psychologists",
                      saver: "Save ₹251.00",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CustomButton(text: "Subscribe", onPressed: null),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Feature row with check icon
  Widget _featureRowBuilder(String feature) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.check, color: AppColors.primaryRed),
            const SizedBox(width: 5),
            Expanded(child: Text(feature)),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _subscriptionCard({
    required int index,
    required String title,
    required String price,
    String? saver,
    required Color iconColor,
    required String description,
  }) {
    bool isSelected = selectedsubscription == index;
    Color textColor = isSelected ? AppColors.primaryRed : Colors.black;
    Color borderColor =
        isSelected ? AppColors.primaryRed : Colors.grey.shade300;
    Color diamondColor = isSelected ? AppColors.primaryRed : iconColor;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2, color: borderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),

                // Price and icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                    Icon(
                      Icons.diamond_rounded,
                      size: 22,
                      color: diamondColor,
                    )
                  ],
                ),

                // Saver (if any)
                SizedBox(
                  height: 25,
                  child: Column(
                    children: [
                      saver == null
                          ? const SizedBox.shrink()
                          : Text(
                              saver,
                              style: TextStyle(
                                fontSize: 11,
                                color: textColor,
                              ),
                            ),
                    ],
                  ),
                ),

                // Description
                Text(
                  description,
                  style: TextStyle(color: textColor),
                )
              ],
            ),
          ),
        ),

        // Checkmark if selected
        if (isSelected)
          Positioned(
            top: -5,
            right: -5,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  color: AppColors.white,
                ),
                Icon(
                  Icons.check_circle,
                  color: AppColors.primaryRed,
                  size: 22,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
