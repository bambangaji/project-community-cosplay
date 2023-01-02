import 'package:coscos/page/dashboard/view/dashboard.dart';
import 'package:coscos/page/login/view/login.dart';
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
  await secureStorage.writeSecureData("userToken", userToken);
  await secureStorage.writeSecureData("nameUser", refressToken);
  await secureStorage.writeSecureData("emailUser", emailUser);
  await secureStorage.writeSecureData("login", 'true');
  Get.off(DashboardPage());
  // Get.until((route) => Get.currentRoute == '/');
}

logOut() async {
  print("logout");
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
  // Get.until((route) => Get.currentRoute == '/login');
  Get.offAll(LoginPage());
}
