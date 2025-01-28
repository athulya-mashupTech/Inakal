import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class AcceptButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const AcceptButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.42, // Button width
        height: 40, // Button height
        child: ElevatedButton(
          onPressed: onPressed ?? () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              backgroundColor: AppColors.primaryRed),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check, color: AppColors.white), 
              SizedBox(width: 5,),
              Text(
                text,
                style: const TextStyle(color: AppColors.white), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
