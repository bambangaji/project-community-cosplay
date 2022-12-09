// ignore_for_file: file_names

import 'package:coscos/api/Methode.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/component/validator.dart';
import 'package:coscos/page/login/view/pin.dart';
import 'package:coscos/page/login/view/register.dart';
import 'package:coscos/page/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isLogin = false.obs;
  var nameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var repasswordController = TextEditingController().obs;
  var showError = false.obs;
  var message = "".obs;
  MainController getMainController() {
    return Get.find<MainController>();
  }

  showErrorMessage(int type, {String text = ""}) {
    if (type == 1) {
      // showError.value = true;
      // message.value = text;
      update();
    } else {
      showError.value = false;
      message.value = "";
      update();
    }
  }

  login() {
    isLogin = true.obs;
    update();
    // Get.off(DashboardPage());
    Get.until((route) => Get.currentRoute == '/');
  }

  resetForm() {
    nameController = TextEditingController().obs;
    emailController = TextEditingController().obs;
    passwordController = TextEditingController().obs;
    repasswordController = TextEditingController().obs;
    update();
  }

  goToRegister() {
    resetForm();
    Get.to(const RegisterPage());
  }

  register() async {
    if (nameController.value.text.length >= 5 ||
        GetUtils.isEmail(emailController.value.text) ||
        validateStructure(passwordController.value.text) ||
        validateStructure(repasswordController.value.text)) {
      if (passwordController.value.text == repasswordController.value.text) {
        var data = {
          "name": nameController.value.text,
          "email": emailController.value.text,
          "password": passwordController.value.text
        };
        getMainController().changeLoading();
        var retval = await registerAccount(data);
        getMainController().changeLoading();
        if (retval.data.id != "") {
          Get.to(const PageOTP());
        } else {
          CustomWidget.showDialog("Register", retval.error.message);
        }
      } else {
        CustomWidget.showSnackBar("Password not matchs");
      }
    } else {
      CustomWidget.showSnackBar("Form can't be empty");
    }
  }
}
