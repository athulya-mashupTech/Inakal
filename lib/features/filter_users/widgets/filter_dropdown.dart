import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class FilterDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final ValueChanged<String> onChanged;
  final String? selectedValue;

  const FilterDropdown({
    required this.label,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<String>(
      initialValue: TextEditingValue(text: selectedValue ?? ''),
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return items.where((String item) =>
            item.toLowerCase().contains(textEditingValue.text.toLowerCase()));
      },
      displayStringForOption: (String option) => option,
      fieldViewBuilder: (BuildContext context, TextEditingController controller,
          FocusNode focusNode, VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: label,
            fillColor: AppColors.white,
            labelStyle: TextStyle(color: AppColors.grey, fontSize: 14),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.primaryRed),
            ),
          ),
        );
      },
      onSelected: onChanged,
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        final optionList = options.toList();
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: optionList.isEmpty
                  ? ListTile(
                      title: Text(
                        'No matches found',
                        style: TextStyle(color: AppColors.grey),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: optionList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final option = optionList[index];
                        return ListTile(
                          title: Text(option),
                          onTap: () => onSelected(option),
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
