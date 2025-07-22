class UserRegistrationDataModel {
  String? userFirstName;
  String? userLastName;
  String? userEmail;

  String? maritalStatus;
  String? noOfChildren;
  String? userProfileCreatedFor;
  String? userPhoneNumber;
  String? userCountryCode;

  String? userAddress;
  String? userDistrict;
  String? userState;
  String? userCountry;
  String? userPincode;
  String? userDob;
  String? userGender;

  String? userReligion;
  String? userCaste;
  String? userSubcaste;
  String? userBirthStar;
  String? userDescription;

  String? userHobbies;
  String? userPassword;

  UserRegistrationDataModel({
    this.userFirstName,
    this.userLastName,
    this.userEmail,
    this.userProfileCreatedFor,
    this.userPhoneNumber,
    this.userCountryCode,
    this.userAddress,
    this.userDistrict,
    this.userState,
    this.userCountry,
    this.userPincode,
    this.userDob,
    this.userGender,
    this.userReligion,
    this.userCaste,
    this.userSubcaste,
    this.userBirthStar,
    this.userDescription,
    this.userHobbies,
    this.userPassword,
    this.maritalStatus,
    this.noOfChildren
  });

  Map<String, dynamic> toJson() {
    return {
      'userFirstName': userFirstName,
      'userLastName': userLastName,
      'userEmail': userEmail,
      'userProfileCreatedFor': userProfileCreatedFor,
      'userPhoneNumber': userPhoneNumber,
      'userCountryCode': userCountryCode,
      'userAddress': userAddress,
      'userDistrict': userDistrict,
      'userState': userState,
      'userCountry': userCountry,
      'userPincode': userPincode,
      'userDob': userDob,
      'userGender': userGender,
      'userReligion': userReligion,
      'userCaste': userCaste,
      'userSubcaste': userSubcaste,
      'userBirthStar': userBirthStar,
      'userDescription': userDescription,
      'userHobbies': userHobbies,
      'userPassword': userPassword,
      'maritalStatus': maritalStatus,
      "noOfChildren": noOfChildren
    };
  }

  factory UserRegistrationDataModel.fromJson(Map<String, dynamic> json) {
    return UserRegistrationDataModel(
      userFirstName: json['userFirstName'],
      userLastName: json['userLastName'],
      userEmail: json['userEmail'],
      userProfileCreatedFor: json['userProfileCreatedFor'],
      userPhoneNumber: json['userPhoneNumber'],
      userCountryCode: json['userCountryCode'],
      userAddress: json['userAddress'],
      userDistrict: json['userDistrict'],
      userState: json['userState'],
      userCountry: json['userCountry'],
      userPincode: json['userPincode'],
      userDob: json['userDob'],
      userGender: json['userGender'],
      userReligion: json['userReligion'],
      userCaste: json['userCaste'],
      userSubcaste: json['userSubcaste'],
      userBirthStar: json['userBirthStar'],
      userDescription: json['userDescription'],
      userHobbies: json['userHobbies'],
      userPassword: json['userPassword'],
      maritalStatus: json['maritalStatus'],
      noOfChildren: json['noOfChildren']
    );
  }
}
