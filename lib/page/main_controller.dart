import 'package:get/get.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  changeLoading() {
    isLoading.value = !isLoading.value;
    update();
  }
}
