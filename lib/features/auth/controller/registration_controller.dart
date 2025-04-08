import 'package:get/get.dart';
import 'package:inakal/features/auth/model/user_registration_data_model.dart';

class RegistrationController extends GetxController {
  var user = UserRegistrationDataModel().obs;

  void setBasicDetails({
    required String firstName,
    required String lastName,
    required String email,
    required String address,
    required String country,
    required String state,
    required String district,
    required String pincode,
    required String dob,
    required String gender,
  }) {
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
    });
  }

  void setReligionDetails({
    required String religion,
    required String caste,
    required String birthStar,
    required String description,
  }) {
    user.update((val) {
      val?.userReligion = religion;
      val?.userCaste = caste;
      val?.userBirthStar = birthStar;
      val?.userDescription = description;
    });
  }

  void setHobbies(List<String> hobbies) {
    user.update((val) {
      val?.userHobbies = hobbies.join(','); // Convert list to comma-separated string
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
