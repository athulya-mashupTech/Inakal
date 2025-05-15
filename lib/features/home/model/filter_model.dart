class FilterModel {
  final String? id;
  final String? location;
  final double? minHeight;
  final double? maxHeight;
  final int? minAge;
  final int? maxAge;
  final Set<String>? interests;

  FilterModel({
    this.id,
    this.location,
    this.minHeight,
    this.maxHeight,
    this.minAge,
    this.maxAge,
    this.interests,
  });
}
