import 'package:coscos/page/dashboard/view/dashboard.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var isLogin = false.obs;

  login() {
    isLogin = true.obs;
    update();
    // Get.off(DashboardPage());
    Get.until((route) => Get.currentRoute == '/');
  }
}
