// ignore_for_file: non_constant_identifier_names
import 'package:coscos/service/storage.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var isLogin = false.obs;
  var showError = false.obs;
  var obsecureText = true.obs;
  var message = "".obs;
  var appBar = false.obs;
  Function(String)? callBackSelected;
  // List<DropdownModel> items = [];
  // String selectedItem = "";
  // String titleDropdown = "";
  // Widget showDropDown(
  //     {required Function(String) onSelected,
  //     required String title,
  //     required List<DropdownModel> item}) {
  //   items = item;
  //   titleDropdown = title;
  //   callBackSelected = onSelected;
  //   update();
  //   return CustomDropDown();
  // }

  // selectedDropdown(String s) {
  //   selectedItem = s;
  //   update();
  //   print(selectedItem);
  // }

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

  showAppBar(val) {
    appBar.value = val;
    update();
  }

  // List<
  cekLogin() async {
    var data = await SecureStorage().readSecureData('login');
    if (data == 'true') {
      isLogin.value = true;
    } else {
      isLogin.value = false;
    }
    update();
  }

  changeObsecureText() {
    obsecureText.value = !obsecureText.value;
    update();
  }

  // login() {
  //   isLogin = true.obs;
  //   update();
  //   // Get.off(DashboardPage());
  //   // Get.until((route) => Get.currentRoute == '/');
  // }

  changeLoading() {
    isLoading.value = !isLoading.value;
    update();
  }
}
