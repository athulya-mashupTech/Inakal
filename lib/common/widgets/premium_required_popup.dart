import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';

class PremiumRequiredPopup extends StatelessWidget {
  const PremiumRequiredPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Lottie.asset("assets/lottie/premium_required.json",
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: Column(
              children: [
                Text(
                  "Unlock Premium Features",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "A valid Subscription Plan is required to access this feature.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                CustomButton(text: "View Subscription Plans"),
                SizedBox(height: 15),
              ],
            ),
          )
        ],
      ),
    );
  }
}
