class RequestUserDetailsModel {
  final String firstName;
  final String lastName;
  final String district;
  final String state;
  final String dob;
  final String height;
  final String religion;
  final String caste;
  final String occupation;
  final String lastSeen;
  final String status;

  RequestUserDetailsModel({
    required this.firstName,
    required this.lastName,
    required this.district,
    required this.state,
    required this.dob,
    required this.height,
    required this.religion,
    required this.caste,
    required this.occupation,
    required this.lastSeen,
    required this.status,
  });

  factory RequestUserDetailsModel.fromJson(Map<String, dynamic> json, String status) {
    return RequestUserDetailsModel(
      firstName: json['first_name'] ?? "First Name",
      lastName: json['last_name'] ?? "Last Name",
      district: json['district'],
      state: json['state'],
      dob: json['dob'],
      height: json['height'],
      religion: json['religion'],
      caste: json['caste'],
      occupation: json['occupation'],
      lastSeen: json['last_seen'],
      status: status,
    );
  }
}
