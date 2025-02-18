import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  static Future<bool> hasInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
