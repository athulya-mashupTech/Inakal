import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class FilterDropdown extends StatefulWidget {
  final String label;
  final List<String> items;
  final ValueChanged<String> onChanged;
  TextEditingController valueController;
  String? selectedValue;

  FilterDropdown({
    required this.label,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    required this.valueController,
    super.key,
  });

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  bool isDropdownOpen = false;
  TextEditingController searchController = TextEditingController();
  List<String> filteredItems = [];
  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();
  final GlobalKey dropdownKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    searchController.dispose();
    _closeDropdown();
    super.dispose();
  }

  void _filterItems() {
    setState(() {
      if (searchController.text.isEmpty) {
        filteredItems = widget.items;
      } else {
        filteredItems = widget.items
            .where((item) => item
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
            .toList();
      }
    });
    _updateOverlay();
  }

  void _toggleDropdown() {
    if (isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    setState(() {
      isDropdownOpen = true;
    });

    overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(overlayEntry!);
  }

  void _closeDropdown() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
    }
    setState(() {
      isDropdownOpen = false;
    });
    searchController.clear();
    filteredItems = widget.items;
  }

  void _updateOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.markNeedsBuild();
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox =
        dropdownKey.currentContext!.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // This captures taps outside the dropdown
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _closeDropdown,
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            left: offset.dx,
            top: offset.dy + size.height + 5.0,
            width: size.width,
            child: CompositedTransformFollower(
              link: layerLink,
              showWhenUnlinked: false,
              offset: Offset(0.0, size.height + 5.0),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 250),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Search bar
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search ${widget.label}...',
                            prefixIcon: const Icon(Icons.search, size: 20),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: AppColors.primaryRed),
                            ),
                            isDense: true,
                          ),
                          autofocus: true,
                        ),
                      ),
                      const Divider(height: 1),
                      // Options list
                      Flexible(
                        child: filteredItems.isEmpty
                            ? const SizedBox(
                                height: 100,
                                child: Center(
                                  child: Text(
                                    "No matches found",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemCount: filteredItems.length,
                                itemBuilder: (context, index) {
                                  final item = filteredItems[index];
                                  final isSelected =
                                      item == widget.selectedValue;

                                  return InkWell(
                                    onTap: () {
                                      widget.onChanged(item);
                                      setState(() {
                                        widget.selectedValue = item;
                                        widget.valueController.text = item;
                                      });
                                      _closeDropdown();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? AppColors.primaryRed
                                                .withOpacity(0.1)
                                            : null,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: isSelected
                                                    ? AppColors.primaryRed
                                                    : Colors.black87,
                                                fontWeight: isSelected
                                                    ? FontWeight.w600
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          if (isSelected)
                                            const Icon(
                                              Icons.check,
                                              size: 18,
                                              color: AppColors.primaryRed,
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        CompositedTransformTarget(
          link: layerLink,
          child: GestureDetector(
            key: dropdownKey,
            onTap: () {
              FocusScope.of(context)
                  .unfocus(); // Prevents keyboard from opening
              _toggleDropdown(); // Opens your overlay
            },
            child: AbsorbPointer(
              // Prevents interaction with the field itself
              child: TextFormField(
                maxLines: 1,
                readOnly: true,
                controller: widget.valueController, // Already has the selected value
                decoration: InputDecoration(
                  labelText: widget.label,
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
              ),
            ),
          ),
        )
      ],
    );
  }
}
