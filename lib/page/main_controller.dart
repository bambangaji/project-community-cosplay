import 'package:coscos/page/dashboard/view/dashboard.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var isLogin = false.obs;
  var showError = false.obs;
  var obsecureText = true.obs;
  var message = "".obs;

  showErrorMessage(int type, {String text = ""}) {
    if (type == 1) {
      showError.value = true;
      message.value = text;
      update();
    } else {
      showError.value = false;
      message.value = "";
      update();
    }
  }

  changeObsecureText() {
    obsecureText.value = !obsecureText.value;
    update();
  }

  login() {
    isLogin = true.obs;
    update();
    // Get.off(DashboardPage());
    Get.until((route) => Get.currentRoute == '/');
  }

  changeLoading() {
    isLoading.value = !isLoading.value;
    update();
    print("loading::" + isLoading.value.toString());
  }
}
