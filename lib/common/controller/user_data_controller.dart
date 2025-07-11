import 'package:get/get.dart';
import 'package:inakal/common/model/user_data_model.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/model/gallery_images_model.dart';

class UserDataController extends GetxController {
  var userData = UserDataModel().obs;
  var galleryImages = GalleryImagesModel().obs;
  var dropdownModel = DropdownModel().obs;

  // method to update userData
  void setUserData(UserDataModel data) {
    userData.value = data;
  }

  // method to update userData
  void setDropDownData(DropdownModel dropdownData) {
    dropdownModel.value = dropdownData;
  }

  void setGalleryImages(GalleryImagesModel galleryImagesModel) {
    // galleryImages.update((val) {
    //   val = galleryImagesModel;
    // });
    galleryImages.value = galleryImagesModel;
    print(galleryImages.value.gallery?.length);
  }

  void clearAll() {
    userData.value = UserDataModel();
    galleryImages.value = GalleryImagesModel();
    dropdownModel.value = DropdownModel();
  }

  void updateGalleryImages(GalleryImagesModel galleryImagesModel) {
    galleryImages.update((val) {
      val?.gallery = galleryImagesModel.gallery;
    });
    print(galleryImages.value.gallery?.length);
  }

  Future<void> updateProfileDetails(
    String firstName,
    String lastName,
    String email,
    String phone,
    String countryCode,
    String dob,
    String gender,
  ) async {
    userData.update((val) {
      val?.user?.firstName = firstName;
      val?.user?.lastName = lastName;
      val?.user?.email = email;
      val?.user?.phone = phone;
      val?.user?.countryCode = countryCode;
      val?.user?.dob = dob;
      val?.user?.gender = gender;
    });
  }

  Future<void> updateProfilePicture(
    String imageUrl,
  ) async {
    userData.update((val) {
      val?.user?.image = imageUrl;
    });
  }

  Future<void> updatePersonalDetails(
    String height,
    String weight,
    String religion,
    String caste,
    String otherCastes,
    String subCaste,
    String starSign,
    String motherTongue,
    String maritalStatus,
    String languagesKnown,
    String noOfChildren,
  ) async {
    userData.update((val) {
      val?.user?.height = height;
      val?.user?.weight = weight;
      val?.user?.religion = religion;
      val?.user?.caste = caste;
      val?.user?.otherCasteSubcaste = otherCastes;
      val?.user?.subCaste = subCaste;
      val?.user?.starSign = starSign;
      val?.user?.motherTongue = motherTongue;
      val?.user?.maritalStatus = maritalStatus;
      val?.user?.languagesKnown = languagesKnown;
      val?.user?.numberOfChildren = noOfChildren;
    });
  }

  Future<void> updateEduProfDetails(
    String highestEducation,
    String qualification,
    String educationalDetails,
    String occupation,
    String occupationDetails,
    String annualIncome,
    String workLocation,
  ) async {
    userData.update((val) {
      val?.user?.highestEducation = highestEducation;
      val?.user?.qualification = qualification;
      val?.user?.educationDetails = educationalDetails;
      val?.user?.occupation = occupation;
      val?.user?.occupationDetails = occupationDetails;
      val?.user?.annualIncome = annualIncome;
      val?.user?.workLocation = workLocation;
    });
  }

  Future<void> updateFamilyDetails(
    String familyType,
    String mothersOccupation,
    String fathersOccupation,
    String numberOfSiblings,
    String siblingsMaritalStatus,
  ) async {
    userData.update((val) {
      val?.user?.familyType = familyType;
      val?.user?.mothersOccupation = mothersOccupation;
      val?.user?.fathersOccupation = fathersOccupation;
      val?.user?.numberOfSiblings = numberOfSiblings;
      val?.user?.siblingsMaritalStatus = siblingsMaritalStatus;
    });
  }

  Future<void> updatePartnerPrefDetails(
    String preferredAgeRange,
    String preferredHeightRange,
    String preferredReligion,
    String preferredCaste,
    String preferredSmokingHabbits,
    String preferredDrinkingHabbits,
    String foodPreferences,
    String preferredQualification,
    String score,
  ) async {
    userData.update((val) {
      val?.user?.preferredAgeRange = preferredAgeRange;
      val?.user?.preferredHeightRange = preferredHeightRange;
      val?.user?.preferredReligion = preferredReligion;
      val?.user?.preferredCaste = preferredCaste;
      val?.user?.preferredSmokingHabits = preferredSmokingHabbits;
      val?.user?.preferredDrinkingHabits = preferredDrinkingHabbits;
      val?.user?.foodPreferences = foodPreferences;
      val?.user?.preferredQualification = preferredQualification;
      val?.user?.score = score;
    });
  }

  Future<void> updateLocationDetails(
    String country,
    String state,
    String district,
    String zipcode,
    String address,
    String currentCity,
  ) async {
    userData.update((val) {
      val?.user?.country = country;
      val?.user?.state = state;
      val?.user?.district = district;
      val?.user?.zipCode = zipcode;
      val?.user?.address = address;
      val?.user?.currentCity = currentCity;
    });
  }

  Future<void> updateAdditionalDetails(
    String aboutMe,
    String smokingHabbits,
    String drinkingHabbits,
    String foodpreferences,
    String profileApproved,
    String profileCreatedBy,
    String instagramLink,
    String facebookLink,
    String linkedinLink,
    String youtubeLink,
  ) async {
    userData.update((val) {
      val?.user?.aboutMe = aboutMe;
      val?.user?.smokingHabits = smokingHabbits;
      val?.user?.drinkingHabits = drinkingHabbits;
      val?.user?.foodPreferences = foodpreferences;
      val?.user?.profileApproved = profileApproved;
      val?.user?.profileCreatedBy = profileCreatedBy;
      val?.user?.instagramLink = instagramLink;
      val?.user?.facebookLink = facebookLink;
      val?.user?.linkedinLink = linkedinLink;
      val?.user?.youtubeLink = youtubeLink;
    });
  }
}
