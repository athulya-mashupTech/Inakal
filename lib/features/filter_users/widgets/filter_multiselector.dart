import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class FilterMultiselectorDropdown extends StatefulWidget {
  final String label;
  final List<String> items;
  final TextEditingController valueController;

  const FilterMultiselectorDropdown({
    required this.label,
    required this.items,
    required this.valueController,
    super.key,
  });

  @override
  State<FilterMultiselectorDropdown> createState() =>
      _FilterMultiselectorDropdownState();
}

class _FilterMultiselectorDropdownState
    extends State<FilterMultiselectorDropdown> {
  bool isExpanded = false;
  TextEditingController searchController = TextEditingController();
  List<String> selectedItems = [];

  String query = "";

  @override
  void initState() {
    super.initState();

    widget.valueController.addListener(() {
      if (widget.valueController.text == "") {
        setState(() {
          selectedItems = [];
        });
      }
    });

    searchController.addListener(() {
      setState(() {
        query = searchController.text;
      });
    });

    // If controller has initial value, populate selectedItems
    if (widget.valueController.text.isNotEmpty) {
      selectedItems =
          widget.valueController.text.split(',').map((e) => e.trim()).toList();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    FocusScope.of(context).unfocus(); // hide keyboard
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void _toggleItem(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }

      widget.valueController.text = selectedItems.join(', ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleExpansion,
          child: AbsorbPointer(
            child: TextFormField(
              controller: widget.valueController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Select ${widget.label}',
                labelStyle: const TextStyle(fontSize: 14),
                suffixIcon: Icon(
                  isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: AppColors.primaryRed),
                ),
                filled: true,
                fillColor: AppColors.white,
              ),
            ),
          ),
        ),
        if (isExpanded) ...[
          const SizedBox(height: 10),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search ${widget.label}...',
              prefixIcon: const Icon(Icons.search, size: 20),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: AppColors.primaryRed),
              ),
            ),
          ),
          const SizedBox(height: 10),
          widget.items
                  .where((item) => item.toLowerCase().contains(query))
                  .toList()
                  .isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "No matches found",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.items
                        .where((item) => item.toLowerCase().contains(query))
                        .toList()
                        .length,
                    itemBuilder: (context, index) {
                      final item = widget.items
                          .where((item) => item.toLowerCase().contains(query))
                          .toList()[index];
                      final isSelected = selectedItems.contains(item);

                      return ListTile(
                        title: Text(
                          item,
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.primaryRed
                                : AppColors.black,
                          ),
                        ),
                        trailing: isSelected
                            ? const Tooltip(
                                message: 'Deselect',
                                child: Icon(Icons.check,
                                    color: AppColors.primaryRed),
                              )
                            : null,
                        onTap: () => _toggleItem(item),
                      );
                    },
                  ),
                ),
        ],
      ],
    );
  }
}
