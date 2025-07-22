import 'package:get/get.dart';
import 'package:inakal/features/auth/model/user_registration_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var user = UserRegistrationDataModel().obs;
  var token = ''.obs;
  var userId = ''.obs;

  // Save token & userId to SharedPreferences
  Future<void> saveAuthData(String authToken, String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', authToken);
    await prefs.setString('userId', id);

    token.value = authToken;
    userId.value = id;
  }

  Future<void> loadAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
    userId.value = prefs.getString('userId') ?? '';
  }

  // Clear stored data (on logout)
  Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('userId');
    token.value = '';
    userId.value = '';
  }

  void setBasicDetails(
      {required String firstName,
      required String lastName,
      required String email,
      required String address,
      required String country,
      required String state,
      required String district,
      required String pincode,
      required String dob,
      required String gender,
      required String maritalStatus,
      required String noOfChildren}) {
    user.update((val) {
      val?.userFirstName = firstName;
      val?.userLastName = lastName;
      val?.userEmail = email;
      val?.userAddress = address;
      val?.userCountry = country;
      val?.userState = state;
      val?.userDistrict = district;
      val?.userPincode = pincode;
      val?.userDob = dob;
      val?.userGender = gender;
      val?.maritalStatus = maritalStatus;
      val?.noOfChildren = noOfChildren;
    });
  }

  void setReligionDetails({
    required String religion,
    required String caste,
    required String subcaste,
    required String birthStar,
    required String description,
  }) {
    user.update((val) {
      val?.userReligion = religion;
      val?.userCaste = caste;
      val?.userBirthStar = birthStar;
      val?.userDescription = description;
      val?.userSubcaste = subcaste;
    });
  }

  void setHobbies(List<String> hobbies) {
    user.update((val) {
      val?.userHobbies =
          hobbies.join(','); // Convert list to comma-separated string
    });
  }

  void setProfileCreatedFor(String profileCreatedFor) {
    user.update((val) {
      val?.userProfileCreatedFor = profileCreatedFor;
    });
  }

  void setMobileNumber(String phoneNumber, String countryCode) {
    user.update((val) {
      val?.userPhoneNumber = phoneNumber;
      val?.userCountryCode = countryCode;
    });
  }

  void setPassword(String password) {
    user.update((val) {
      val?.userPassword = password;
    });
  }

  void clearAll() {
    user.value = UserRegistrationDataModel(); // Reset all fields
  }
}
