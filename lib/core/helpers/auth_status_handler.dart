import 'package:tasky/core/constants/app_constants.dart';
import 'package:tasky/core/helpers/token_storage.dart';

class AuthStatusHandler {
  static Future<void> checkUserLoginStatus() async {
    String? userToken = await TokenStorage.getAccessToken();
    if (userToken != null && userToken.isNotEmpty) {
      AppConstants.isLoggedIn = true;
    } else {
      AppConstants.isLoggedIn = false;
    }
  }
}
