import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/model/districts_search_model.dart';
import 'package:inakal/features/auth/registration/widgets/text_field_widget.dart';
import 'package:inakal/features/auth/service/auth_service.dart';

class SearchableDistrictWidget extends StatefulWidget {
  final String label;
  final TextEditingController valueController;
  final String? Function(String?)? validator;

  const SearchableDistrictWidget(
      {required this.label,
      required this.valueController,
      this.validator,
      super.key});

  @override
  State<SearchableDistrictWidget> createState() =>
      _SearchableDistrictWidgetState();
}

class _SearchableDistrictWidgetState extends State<SearchableDistrictWidget> {
  bool _focusListenerAdded = false;
  DistrictsSearchModel districtsOptionsModel = DistrictsSearchModel();

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<String>> _getSearchedDistricts(String query) async {
    if (query.isEmpty) {
      return [];
    }

    try {
      final value = await AuthService().getDistricts(query);
      setState(() {
        districtsOptionsModel = value;
      });
      final items = (value.districts ?? [])
          .map((district) => district.name ?? "")
          .where((name) => name.isNotEmpty)
          .toList();
      return items;
    } catch (e) {
      // Handle error gracefully
      print('Error fetching districts: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }

        // Fetch districts based on the current input
        final districts = await _getSearchedDistricts(textEditingValue.text);

        return districts.where((district) => district
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase()));
      },
      onSelected: (String selection) {
        print('Selected: $selection');
        setState(() {
          widget.valueController.text = (districtsOptionsModel.districts ?? [])
                  .firstWhere(
                    (district) => district.name == selection,
                    orElse: () => Districts(id: "", name: ""),
                  )
                  .id ??
              "";
        });
        
        print('Selected id: ${widget.valueController.text}');
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        // Add focus listener only once
        if (!_focusListenerAdded) {
          focusNode.addListener(() {
            if (!focusNode.hasFocus) {
              _handleFocusLoss(textEditingController);
            }
          });
          _focusListenerAdded = true;
        }

        return TextFieldWidget(
          controller: textEditingController,
          hintText: "Select District",
          focusNode: focusNode,
          validator: widget.validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'District is required';
                }
                return null;
              },
        );
      },
    );
  }

  void _handleFocusLoss(TextEditingController textEditingController) async {
    final currentText = textEditingController.text.trim();

    if (currentText.isEmpty) {
      return;
    }

    // Check if the entered text matches any valid district
    final districts = await _getSearchedDistricts(currentText);
    final isValidDistrict = districts
        .any((district) => district.toLowerCase() == currentText.toLowerCase());

    if (!isValidDistrict) {
      // Clear the text if it doesn't match any valid district
      textEditingController.clear();
      setState(() {
        widget.valueController.clear();
      });
    } else {
      // Update the main controller if it's a valid district
      setState(() {
        widget.valueController.text = currentText;
      });
    }
  }
}
