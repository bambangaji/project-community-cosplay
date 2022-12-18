import 'package:coscos/service/storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveLogin(String userToken, String refressToken, String emailUser) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('userToken', userToken);
  prefs.setString('refressToken', refressToken);
  prefs.setString('emailUser', emailUser);
  prefs.setBool('login', true);
  SecureStorage secureStorage = SecureStorage();
  secureStorage.writeSecureData("userToken", userToken);
  secureStorage.writeSecureData("nameUser", refressToken);
  secureStorage.writeSecureData("emailUser", emailUser);
  secureStorage.writeSecureData("login", 'true');
  Get.until((route) => Get.currentRoute == '/');
}

logOut() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('userToken', '');
  prefs.setString('refressToken', '');
  prefs.setString('emailUser', '');
  prefs.setBool('login', false);
  SecureStorage secureStorage = SecureStorage();
  secureStorage.writeSecureData("userToken", '');
  secureStorage.writeSecureData("nameUser", '');
  secureStorage.writeSecureData("emailUser", '');
  secureStorage.writeSecureData("login", 'false');
  Get.offNamed('/login');
}
