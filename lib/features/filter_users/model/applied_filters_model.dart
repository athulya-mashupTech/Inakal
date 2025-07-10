class AppliedFiltersModel {
  String filterReligion;
  List<String> filterCaste;
  List<String> filterSubCaste;
  String filterAgeGroup;
  String filterHeight;
  String filterWeight;
  String filterState;
  String filterMotherTongue;
  String filterMaritalStatus;
  String filterEducation;
  List<String> filterOccupation;
  String filterAnnualIncome;
  String filterFoodPreference;

  AppliedFiltersModel({
    required this.filterReligion,
    required this.filterCaste,
    required this.filterSubCaste,
    required this.filterAgeGroup,
    required this.filterHeight,
    required this.filterWeight,
    required this.filterState,
    required this.filterMotherTongue,
    required this.filterMaritalStatus,
    required this.filterEducation,
    required this.filterOccupation,
    required this.filterAnnualIncome,
    required this.filterFoodPreference
  });
}
