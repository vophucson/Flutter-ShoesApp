import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Model/Profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'LoginController.dart';

class ProfileController extends GetxController {
  LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  var isLoading = true.obs;
  var userImageEdit = ''.obs;
  var userNameEdit = ''.obs;
  var phoneEdit = ''.obs;
  var addressEdit = ''.obs;
  var isReload = 0.obs;
  var success = 0.obs;
  var userId = 0.obs;
  var userName = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;
  var address = ''.obs;
  var userImage = ''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchProfile() async {
    try {
      isLoading(true);
      var response = await APIService.getUser(
          loginController.box.read('userId'),
          loginController.box.read('token'));
      if (response.success == 1) {
        userId(response.data![0].id);
        userName(response.data![0].userName);
        phone(response.data![0].phone);
        email(response.data![0].email);
        address(response.data![0].address);
        userImage(response.data![0].userimage);
      }
      success(response.success);
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateProfile() async {
    try {
      isLoading(true);
      if (checkProfile() == true) {
        var response = await APIService.edit(
            userNameEdit.value,
            phoneEdit.value,
            addressEdit.value,
            userImageEdit.value,
            loginController.box.read('userId'),
            loginController.box.read('token'));
        if (response.success == 1) {
          userName(userNameEdit.value);
          phone(phoneEdit.value);
          address(addressEdit.value);
          userImage(userImageEdit.value);
          return Get.snackbar(
            "TH??NG B??O",
            "C???p nh???t th??nh c??ng",
            colorText: Colors.black,
            backgroundColor: Colors.white,
          );
        } else {
          if (response.data != '') {
            return Get.snackbar(
              "TH??NG B??O",
              "${response.data}",
              colorText: Colors.black,
              backgroundColor: Colors.white,
            );
          } else {
            return Get.snackbar(
              "L???i",
              "Kh??ng th??? thay ?????i th??ng tin",
              colorText: Colors.black,
              backgroundColor: Colors.white,
            );
          }
        }
      }
    } finally {
      isLoading(false);
    }
  }

  bool checkProfile() {
    final form = profileFormKey.currentState;
    if (form!.validate() == true) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  String? validateName(String value) {
    if (value.length <= 6) {
      return "Vui l??ng nh???p d??? h??? v?? t??n ??t nh???t 6 k?? t???";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.length <= 9) {
      return "Vui l??ng nh???p l???i s??? di???n tho???i";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.length <= 10) {
      return "Vui l??ng nh???p ch??nh x??c ?????a ch???";
    }
    return null;
  }
}
