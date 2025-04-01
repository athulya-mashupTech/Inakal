import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class CountryStateCityWidget extends StatefulWidget {
  final TextEditingController countryController;
  final TextEditingController stateController;
  final TextEditingController cityController;
  final bool isChecked;

  const CountryStateCityWidget(
      {super.key,
      required this.countryController,
      required this.stateController,
      required this.cityController, 
      required this.isChecked}
    );

  @override
  State<CountryStateCityWidget> createState() => _CountryStateCityWidgetState();
}

class _CountryStateCityWidgetState extends State<CountryStateCityWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CountryStateCityPicker(
            country: widget.countryController,
            state: widget.stateController,
            city: widget.cityController,
            dialogColor: Colors.grey.shade200,
            textFieldDecoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.primaryRed, width: 1.5),
                borderRadius: BorderRadius.circular(30.0),
              ),
            )),
            widget.isChecked == true
            ? widget.countryController.text == ""
              ? widget.stateController.text == ""
                  ? widget.cityController.text == ""
                      ? errorText("Country, State & City is required")
                      : errorText("Country & State is required")
                  : errorText("Country is required")
              : widget.stateController.text == ""
                  ? widget.cityController.text == ""
                      ? errorText("State & City is required")
                      : errorText("State is required")
                  : widget.cityController.text == ""
                      ? errorText("City is required")
                      : SizedBox()
            : SizedBox()
        
      ],
    );
  }

  Widget errorText(String errorMsg) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 3),
      child: Text(
        errorMsg,
        style: TextStyle(fontSize: 12, color: AppColors.errorRed),
      ),
    );
  }
}
