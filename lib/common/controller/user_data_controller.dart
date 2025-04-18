import 'package:get/get.dart';
import 'package:inakal/common/model/user_data_model.dart';

class UserDataController extends GetxController {
  var userData = UserDataModel().obs;

  // method to update userData
  void setUserData(UserDataModel data) {
    userData.value = data;
  }
}