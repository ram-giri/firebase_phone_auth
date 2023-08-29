// import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/app/models/user_model.dart';
import 'package:user_app/app/modules/Phone/controllers/phone_controller.dart';
import 'package:user_app/app/routes/app_pages.dart';
import 'package:user_app/app/services/auth.dart';
// import '../../../routes/app_pages.dart';
// import 'package:http/http.dart' as http;
import '../../../services/api_services.dart';

class OtpCodeController extends GetxController {
  final cSms = TextEditingController();
  PhoneController phoneController = Get.put(PhoneController());
  AuthService authService = Get.find();
  late PhoneAuthCredential credential;
  String _userId = "";
  String get userId => _userId;
  Future verifyOTP() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    credential = PhoneAuthProvider.credential(
        verificationId: authService.verificationID, smsCode: cSms.text);
    User? user = (await auth.signInWithCredential(credential)).user;
    if (user != null) {
      _userId = user.uid;
      AuthUser? getUser = await FirebseService.getUser(_userId);
      getUser == null
          ? Get.toNamed(Routes.USER_NAME)
          : Get.toNamed(Routes.HOME, arguments: {'userId': _userId});
      // http.Response response = await ApiService.getUser(_userId);
      // var decodedResponse = jsonDecode(response.body);
      // if (decodedResponse['message'] == 'not found') {
      //   Get.toNamed(Routes.FIRST_NAME);
      // } else {
      //   Get.offNamed(Routes.HOME, arguments: {"userId": _userId});
      // }
    }
  }
}
