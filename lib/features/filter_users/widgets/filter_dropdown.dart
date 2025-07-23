import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class FilterDropdown extends StatefulWidget {
  final String label;
  final List<String> items;
  final void Function(String) onSelected;
  final TextEditingController valueController;

  FilterDropdown({
    required this.label,
    required this.items,
    required this.onSelected,
    required this.valueController,
    super.key,
  });

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  bool isExpanded = false;
  TextEditingController searchController = TextEditingController();
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    setState(() {
      final query = searchController.text.toLowerCase();
      filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
  }

  void _toggleExpansion() {
    FocusScope.of(context).unfocus(); // hide keyboard if any
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void _selectItem(String item) {
    setState(() {
      if (widget.valueController.text == item) {
        // Deselect if already selected
        widget.valueController.text = "";
      } else {
        widget.valueController.text = item;
        widget.onSelected(item);
      }
      isExpanded = false;
      searchController.clear();
      filteredItems = widget.items;
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
          filteredItems.isEmpty
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
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      final isSelected = widget.valueController.text == item;

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
                        onTap: () => _selectItem(item),
                      );
                    },
                  ),
                ),
        ],
      ],
    );
  }
}
