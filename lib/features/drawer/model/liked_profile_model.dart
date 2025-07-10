class LikedProfileModel {
  List<RelatedProfiles>? relatedProfiles;
  String? message;
  String? type;

  LikedProfileModel({this.relatedProfiles, this.message, this.type});

  LikedProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? secondaryNumber;
  String? password;
  String? dob;
  String? gender;
  String? image;
  String? height;
  String? weight;
  String? religion;
  String? caste;
  String? subCaste;
  String? otherCasteSubcaste;
  String? starSign;
  String? motherTongue;
  String? languagesKnown;
  String? maritalStatus;
  String? numberOfChildren;
  String? address;
  String? currentCity;
  String? district;
  String? state;
  String? zipCode;
  String? country;
  String? loginCount;
  String? matchesCount;
  String? profileViews;
  String? favoritesCount;
  String? highestEducation;
  String? qualification;
  String? educationDetails;
  String? occupation;
  String? occupationDetails;
  String? annualIncome;
  String? workLocation;
  String? familyType;
  String? familyStatus;
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
  String? remarks;
  String? profileVisibilty;
  String? profileApproved;
  String? verifyDp;
  String? verifiedProfile;
  String? showProfilePic;
  String? showPictureGallery;
  String? showFullName;
  String? otp;
  String? showContactDetails;
  String? otpTime;
  String? registrationStatus;
  String? created;
  String? status;
  String? likedBy;
  String? districtName;
  String? stateName;
  bool? liked;

  RelatedProfiles(
      {this.id,
      this.firstName,
      this.lastName,
      this.countryCode,
      this.phone,
      this.email,
      this.secondaryNumber,
      this.password,
      this.dob,
      this.gender,
      this.image,
      this.height,
      this.weight,
      this.religion,
      this.caste,
      this.subCaste,
      this.otherCasteSubcaste,
      this.starSign,
      this.motherTongue,
      this.languagesKnown,
      this.maritalStatus,
      this.numberOfChildren,
      this.address,
      this.currentCity,
      this.district,
      this.state,
      this.zipCode,
      this.country,
      this.loginCount,
      this.matchesCount,
      this.profileViews,
      this.favoritesCount,
      this.highestEducation,
      this.qualification,
      this.educationDetails,
      this.occupation,
      this.occupationDetails,
      this.annualIncome,
      this.workLocation,
      this.familyType,
      this.familyStatus,
      this.fathersOccupation,
      this.mothersOccupation,
      this.numberOfSiblings,
      this.siblingsMaritalStatus,
      this.preferredAgeRange,
      this.preferredHeightRange,
      this.preferredReligion,
      this.preferredCaste,
      this.preferredSmokingHabits,
      this.preferredDrinkingHabits,
      this.preferredFoodPreferences,
      this.score,
      this.aboutMe,
      this.hobbies,
      this.smokingHabits,
      this.drinkingHabits,
      this.foodPreferences,
      this.profileCompletedPercentage,
      this.membershipType,
      this.profileCreatedBy,
      this.socialMediaLinks,
      this.instagramLink,
      this.facebookLink,
      this.linkedinLink,
      this.youtubeLink,
      this.lastSeen,
      this.consultancyRequired,
      this.needLikeMindedPartner,
      this.assignedLeadId,
      this.preferredQualification,
      this.remarks,
      this.profileVisibilty,
      this.profileApproved,
      this.verifyDp,
      this.verifiedProfile,
      this.showProfilePic,
      this.showPictureGallery,
      this.showFullName,
      this.otp,
      this.showContactDetails,
      this.otpTime,
      this.registrationStatus,
      this.created,
      this.status,
      this.likedBy,
      this.districtName,
      this.stateName,
      this.liked});

  RelatedProfiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    countryCode = json['country_code'];
    phone = json['phone'];
    email = json['email'];
    secondaryNumber = json['secondary_number'];
    password = json['password'];
    dob = json['dob'];
    gender = json['gender'];
    image = json['image'];
    height = json['height'];
    weight = json['weight'];
    religion = json['religion'];
    caste = json['caste'];
    subCaste = json['sub_caste'];
    otherCasteSubcaste = json['other_caste_subcaste'];
    starSign = json['star_sign'];
    motherTongue = json['mother_tongue'];
    languagesKnown = json['languages_known'];
    maritalStatus = json['marital_status'];
    numberOfChildren = json['number_of_children'];
    address = json['address'];
    currentCity = json['current_city'];
    district = json['district'];
    state = json['state'];
    zipCode = json['zipCode'];
    country = json['country'];
    loginCount = json['login_count'];
    matchesCount = json['matches_count'];
    profileViews = json['profile_views'];
    favoritesCount = json['favorites_count'];
    highestEducation = json['highest_education'];
    qualification = json['qualification'];
    educationDetails = json['education_details'];
    occupation = json['occupation'];
    occupationDetails = json['occupation_details'];
    annualIncome = json['annual_income'];
    workLocation = json['work_location'];
    familyType = json['family_type'];
    familyStatus = json['family_status'];
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
    remarks = json['remarks'];
    profileVisibilty = json['profile_visibilty'];
    profileApproved = json['profile_approved'];
    verifyDp = json['verify_dp'];
    verifiedProfile = json['verified_profile'];
    showProfilePic = json['show_profile_pic'];
    showPictureGallery = json['show_picture_gallery'];
    showFullName = json['show_full_name'];
    otp = json['otp'];
    showContactDetails = json['show_contact_details'];
    otpTime = json['otp_time'];
    registrationStatus = json['registration_status'];
    created = json['created'];
    status = json['status'];
    likedBy = json['liked_by'];
    districtName = json['district_name'];
    stateName = json['state_name'];
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['secondary_number'] = this.secondaryNumber;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['religion'] = this.religion;
    data['caste'] = this.caste;
    data['sub_caste'] = this.subCaste;
    data['other_caste_subcaste'] = this.otherCasteSubcaste;
    data['star_sign'] = this.starSign;
    data['mother_tongue'] = this.motherTongue;
    data['languages_known'] = this.languagesKnown;
    data['marital_status'] = this.maritalStatus;
    data['number_of_children'] = this.numberOfChildren;
    data['address'] = this.address;
    data['current_city'] = this.currentCity;
    data['district'] = this.district;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    data['country'] = this.country;
    data['login_count'] = this.loginCount;
    data['matches_count'] = this.matchesCount;
    data['profile_views'] = this.profileViews;
    data['favorites_count'] = this.favoritesCount;
    data['highest_education'] = this.highestEducation;
    data['qualification'] = this.qualification;
    data['education_details'] = this.educationDetails;
    data['occupation'] = this.occupation;
    data['occupation_details'] = this.occupationDetails;
    data['annual_income'] = this.annualIncome;
    data['work_location'] = this.workLocation;
    data['family_type'] = this.familyType;
    data['family_status'] = this.familyStatus;
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
    data['remarks'] = this.remarks;
    data['profile_visibilty'] = this.profileVisibilty;
    data['profile_approved'] = this.profileApproved;
    data['verify_dp'] = this.verifyDp;
    data['verified_profile'] = this.verifiedProfile;
    data['show_profile_pic'] = this.showProfilePic;
    data['show_picture_gallery'] = this.showPictureGallery;
    data['show_full_name'] = this.showFullName;
    data['otp'] = this.otp;
    data['show_contact_details'] = this.showContactDetails;
    data['otp_time'] = this.otpTime;
    data['registration_status'] = this.registrationStatus;
    data['created'] = this.created;
    data['status'] = this.status;
    data['liked_by'] = this.likedBy;
    data['district_name'] = this.districtName;
    data['state_name'] = this.stateName;
    data['liked'] = this.liked;
    return data;
  }
}
