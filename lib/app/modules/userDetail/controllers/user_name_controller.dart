// import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/app/models/user_model.dart';
// import 'package:http/http.dart' as http;
import 'package:user_app/app/modules/OtpCode/controllers/otp_code_controller.dart';
import 'package:user_app/app/modules/Phone/controllers/phone_controller.dart';
import 'package:user_app/app/routes/app_pages.dart';
// import '../../../routes/app_pages.dart';
import '../../../services/api_services.dart';

class UserNameController extends GetxController {
  final userNameController = TextEditingController();
  final fullNameController = TextEditingController();
  PhoneController phoneController = Get.find();
  // FirstNameController firstNameController = Get.find();
  // LastNameController lastNameController = Get.find();
  OtpCodeController otpCodeController = Get.find();

  createUser() async {
    try {
      AuthUser user = AuthUser(
        id: otpCodeController.userId,
        fullName: fullNameController.text,
        userName: userNameController.text,
        phoneNumber: phoneController.phoneNumber,
      );

      var respose = FirebseService().addData(user.toMap(), user.id);
      log(respose.toString());

      // http.Response response = await ApiService().createUser(user);
      // var decodedResponse = jsonDecode(response.body);
      // if (response.statusCode == 200) {
      Get.toNamed(Routes.HOME, arguments: {"userId": otpCodeController.userId});
      // } else if (response.statusCode >= 400 && response.statusCode < 500) {
      //   log(decodedResponse['message']);
      // } else {
      //   throw Exception();
      // }
    } catch (e) {
      log(e.toString());
    }
  }
}
