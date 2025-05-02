class RelatedProfileModel {
  List<RelatedProfiles>? relatedProfiles;
  String? message;
  String? type;

  RelatedProfileModel({required this.relatedProfiles, required this.message, required this.type});

  RelatedProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['related_profiles'] != null) {
      relatedProfiles = <RelatedProfiles>[];
      json['related_profiles'].forEach((v) {
        relatedProfiles!.add(new RelatedProfiles.fromJson(v));
      });
    }
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.relatedProfiles != null) {
      data['related_profiles'] =
          this.relatedProfiles!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}

class RelatedProfiles {
  String? id;
  String? firstName;
  String? lastName;
  String? countryCode;
  String? phone;
  String? email;
  String? password;
  String? dob;
  String? gender;
  String? image;
  String? created;
  String? status;
  String? registrationStatus;
  String? height;
  String? weight;
  String? religion;
  String? caste;
  String? subCaste;
  String? motherTongue;
  String? languagesKnown;
  String? maritalStatus;
  String? numberOfChildren;
  String? address;
  String? district;
  String? state;
  String? zipCode;
  String? country;
  String? currentCity;
  String? showProfilePic;
  String? showPictureGallery;
  String? showFullName;
  String? showContactDetails;
  String? loginCount;
  String? matchesCount;
  String? profileViews;
  String? favoritesCount;
  String? highestEducation;
  String? educationDetails;
  String? occupation;
  String? annualIncome;
  String? workLocation;
  String? familyType;
  String? fathersOccupation;
  String? mothersOccupation;
  String? numberOfSiblings;
  String? siblingsMaritalStatus;
  String? preferredAgeRange;
  String? preferredHeightRange;
  String? preferredReligion;
  String? preferredCaste;
  String? preferredSmokingHabits;
  String? preferredDrinkingHabits;
  String? preferredFoodPreferences;
  String? score;
  String? aboutMe;
  String? hobbies;
  String? smokingHabits;
  String? drinkingHabits;
  String? foodPreferences;
  String? profileCompletedPercentage;
  String? membershipType;
  String? profileCreatedBy;
  String? socialMediaLinks;
  String? instagramLink;
  String? facebookLink;
  String? linkedinLink;
  String? youtubeLink;
  String? lastSeen;
  String? consultancyRequired;
  String? needLikeMindedPartner;
  String? assignedLeadId;
  String? preferredQualification;
  String? starSign;
  String? remarks;
  String? profileVisibilty;
  String? profileApproved;
  String? verifyDp;
  String? verifiedProfile;
  String? otp;
  String? otpTime;

  RelatedProfiles(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.countryCode,
      required this.phone,
      required this.email,
      required this.password,
      required this.dob,
      required this.gender,
      required this.image,
      required this.created,
      required this.status,
      required this.registrationStatus,
      required this.height,
      required this.weight,
      required this.religion,
      required this.caste,
      required this.subCaste,
      required this.motherTongue,
      required this.languagesKnown,
      required this.maritalStatus,
      required this.numberOfChildren,
      required this.address,
      required this.district,
      required this.state,
      required this.zipCode,
      required this.country,
      required this.currentCity,
      required this.showProfilePic,
      required this.showPictureGallery,
      required this.showFullName,
      required this.showContactDetails,
      required this.loginCount,
      required this.matchesCount,
      required this.profileViews,
      required this.favoritesCount,
      required this.highestEducation,
      required this.educationDetails,
      required this.occupation,
      required this.annualIncome,
      required this.workLocation,
      required this.familyType,
      required this.fathersOccupation,
      required this.mothersOccupation,
      required this.numberOfSiblings,
      required this.siblingsMaritalStatus,
      required this.preferredAgeRange,
      required this.preferredHeightRange,
      required this.preferredReligion,
      required this.preferredCaste,
      required this.preferredSmokingHabits,
      required this.preferredDrinkingHabits,
      required this.preferredFoodPreferences,
      required this.score,
      required this.aboutMe,
      required this.hobbies,
      required this.smokingHabits,
      required this.drinkingHabits,
      required this.foodPreferences,
      required this.profileCompletedPercentage,
      required this.membershipType,
      required this.profileCreatedBy,
      required this.socialMediaLinks,
      required this.instagramLink,
      required this.facebookLink,
      required this.linkedinLink,
      required this.youtubeLink,
      required this.lastSeen,
      required this.consultancyRequired,
      required this.needLikeMindedPartner,
      required this.assignedLeadId,
      required this.preferredQualification,
      required this.starSign,
      required this.remarks,
      required this.profileVisibilty,
      required this.profileApproved,
      required this.verifyDp,
      required this.verifiedProfile,
      required this.otp,
      required this.otpTime});

  RelatedProfiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    countryCode = json['country_code'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    dob = json['dob'];
    gender = json['gender'];
    image = json['image'];
    created = json['created'];
    status = json['status'];
    registrationStatus = json['registration_status'];
    height = json['height'];
    weight = json['weight'];
    religion = json['religion'];
    caste = json['caste'];
    subCaste = json['sub_caste'];
    motherTongue = json['mother_tongue'];
    languagesKnown = json['languages_known'];
    maritalStatus = json['marital_status'];
    numberOfChildren = json['number_of_children'];
    address = json['address'];
    district = json['district'];
    state = json['state'];
    zipCode = json['zipCode'];
    country = json['country'];
    currentCity = json['current_city'];
    showProfilePic = json['show_profile_pic'];
    showPictureGallery = json['show_picture_gallery'];
    showFullName = json['show_full_name'];
    showContactDetails = json['show_contact_details'];
    loginCount = json['login_count'];
    matchesCount = json['matches_count'];
    profileViews = json['profile_views'];
    favoritesCount = json['favorites_count'];
    highestEducation = json['highest_education'];
    educationDetails = json['education_details'];
    occupation = json['occupation'];
    annualIncome = json['annual_income'];
    workLocation = json['work_location'];
    familyType = json['family_type'];
    fathersOccupation = json['fathers_occupation'];
    mothersOccupation = json['mothers_occupation'];
    numberOfSiblings = json['number_of_siblings'];
    siblingsMaritalStatus = json['siblings_marital_status'];
    preferredAgeRange = json['preferred_age_range'];
    preferredHeightRange = json['preferred_height_range'];
    preferredReligion = json['preferred_religion'];
    preferredCaste = json['preferred_caste'];
    preferredSmokingHabits = json['preferred_smoking_habits'];
    preferredDrinkingHabits = json['preferred_drinking_habits'];
    preferredFoodPreferences = json['preferred_food_preferences'];
    score = json['score'];
    aboutMe = json['about_me'];
    hobbies = json['hobbies'];
    smokingHabits = json['smoking_habits'];
    drinkingHabits = json['drinking_habits'];
    foodPreferences = json['food_preferences'];
    profileCompletedPercentage = json['profile_completed_percentage'];
    membershipType = json['membership_type'];
    profileCreatedBy = json['profile_created_by'];
    socialMediaLinks = json['social_media_links'];
    instagramLink = json['instagram_link'];
    facebookLink = json['facebook_link'];
    linkedinLink = json['linkedin_link'];
    youtubeLink = json['youtube_link'];
    lastSeen = json['last_seen'];
    consultancyRequired = json['consultancy_required'];
    needLikeMindedPartner = json['need_like_minded_partner'];
    assignedLeadId = json['assigned_lead_id'];
    preferredQualification = json['preferred_qualification'];
    starSign = json['star_sign'];
    remarks = json['remarks'];
    profileVisibilty = json['profile_visibilty'];
    profileApproved = json['profile_approved'];
    verifyDp = json['verify_dp'];
    verifiedProfile = json['verified_profile'];
    otp = json['otp'];
    otpTime = json['otp_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['created'] = this.created;
    data['status'] = this.status;
    data['registration_status'] = this.registrationStatus;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['religion'] = this.religion;
    data['caste'] = this.caste;
    data['sub_caste'] = this.subCaste;
    data['mother_tongue'] = this.motherTongue;
    data['languages_known'] = this.languagesKnown;
    data['marital_status'] = this.maritalStatus;
    data['number_of_children'] = this.numberOfChildren;
    data['address'] = this.address;
    data['district'] = this.district;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    data['country'] = this.country;
    data['current_city'] = this.currentCity;
    data['show_profile_pic'] = this.showProfilePic;
    data['show_picture_gallery'] = this.showPictureGallery;
    data['show_full_name'] = this.showFullName;
    data['show_contact_details'] = this.showContactDetails;
    data['login_count'] = this.loginCount;
    data['matches_count'] = this.matchesCount;
    data['profile_views'] = this.profileViews;
    data['favorites_count'] = this.favoritesCount;
    data['highest_education'] = this.highestEducation;
    data['education_details'] = this.educationDetails;
    data['occupation'] = this.occupation;
    data['annual_income'] = this.annualIncome;
    data['work_location'] = this.workLocation;
    data['family_type'] = this.familyType;
    data['fathers_occupation'] = this.fathersOccupation;
    data['mothers_occupation'] = this.mothersOccupation;
    data['number_of_siblings'] = this.numberOfSiblings;
    data['siblings_marital_status'] = this.siblingsMaritalStatus;
    data['preferred_age_range'] = this.preferredAgeRange;
    data['preferred_height_range'] = this.preferredHeightRange;
    data['preferred_religion'] = this.preferredReligion;
    data['preferred_caste'] = this.preferredCaste;
    data['preferred_smoking_habits'] = this.preferredSmokingHabits;
    data['preferred_drinking_habits'] = this.preferredDrinkingHabits;
    data['preferred_food_preferences'] = this.preferredFoodPreferences;
    data['score'] = this.score;
    data['about_me'] = this.aboutMe;
    data['hobbies'] = this.hobbies;
    data['smoking_habits'] = this.smokingHabits;
    data['drinking_habits'] = this.drinkingHabits;
    data['food_preferences'] = this.foodPreferences;
    data['profile_completed_percentage'] = this.profileCompletedPercentage;
    data['membership_type'] = this.membershipType;
    data['profile_created_by'] = this.profileCreatedBy;
    data['social_media_links'] = this.socialMediaLinks;
    data['instagram_link'] = this.instagramLink;
    data['facebook_link'] = this.facebookLink;
    data['linkedin_link'] = this.linkedinLink;
    data['youtube_link'] = this.youtubeLink;
    data['last_seen'] = this.lastSeen;
    data['consultancy_required'] = this.consultancyRequired;
    data['need_like_minded_partner'] = this.needLikeMindedPartner;
    data['assigned_lead_id'] = this.assignedLeadId;
    data['preferred_qualification'] = this.preferredQualification;
    data['star_sign'] = this.starSign;
    data['remarks'] = this.remarks;
    data['profile_visibilty'] = this.profileVisibilty;
    data['profile_approved'] = this.profileApproved;
    data['verify_dp'] = this.verifyDp;
    data['verified_profile'] = this.verifiedProfile;
    data['otp'] = this.otp;
    data['otp_time'] = this.otpTime;
    return data;
  }
}
