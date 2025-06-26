import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class FilterDropdown extends StatefulWidget {
  final String label;
  final List<String> items;
  TextEditingController valueController;

  FilterDropdown({
    required this.label,
    required this.items,
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
  RenderBox renderBox = dropdownKey.currentContext!.findRenderObject() as RenderBox;
  Size size = renderBox.size;
  Offset offset = renderBox.localToGlobal(Offset.zero);

  double screenHeight = MediaQuery.of(context).size.height;
  double spaceBelow = screenHeight - offset.dy - size.height;
  double spaceAbove = offset.dy;

  bool showAbove = spaceBelow < 250 && spaceAbove > spaceBelow;

  return OverlayEntry(
    builder: (context) {
      return Positioned.fill(
        child: Stack(
          children: [
            // Tap outside to close (only catches taps on blank areas)
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _closeDropdown,
              child: const SizedBox.expand(),
            ),
            Positioned(
              left: offset.dx,
              top: showAbove
                  ? offset.dy - 5.0 - 250 // Adjust height if above
                  : offset.dy + size.height + 5.0,
              width: size.width,
              child: CompositedTransformFollower(
                link: layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, 0),
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
                        // Search Bar
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Search ${widget.label}...',
                              prefixIcon: const Icon(Icons.search, size: 20),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: AppColors.primaryRed),
                              ),
                              isDense: true,
                            ),
                            autofocus: true,
                          ),
                        ),
                        const Divider(height: 1),
                        // Dropdown List
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
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.valueController.text = item;
                                        });
                                        _closeDropdown();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                        decoration: const BoxDecoration(color: AppColors.white),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: widget.valueController.text == item
                                                      ? AppColors.primaryRed
                                                      : AppColors.black,
                                                ),
                                              ),
                                            ),
                                            if (widget.valueController.text == item)
                                              const Icon(Icons.check, size: 18, color: AppColors.primaryRed),
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
    },
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
                controller:
                    widget.valueController, // Already has the selected value
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
