// ignore_for_file: file_names

import 'package:coscos/page/profile/model/profileModel.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class profileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ProfileData? profileData;

  updateProfile(ProfileData data) {
    profileData = data;
    update();
  }
}
