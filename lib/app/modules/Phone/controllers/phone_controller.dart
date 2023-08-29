import 'dart:developer';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/app/services/auth.dart';

class PhoneController extends GetxController {
  final pController = TextEditingController();
  AuthService authservice = Get.find();

  Rx<Country> country = Country(
    phoneCode: "977",
    countryCode: "NP",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Nepal",
    example: "Nepal",
    displayName: "Nepal",
    displayNameNoCountryCode: "NP",
    e164Key: "",
  ).obs;
  String get phoneNumber => "+${country.value.phoneCode}${pController.text}";

  verifyPhone() async {
    log(phoneNumber);
    authservice.createUser(phoneNumber);
  }

  countryPicker() {
    showCountryPicker(
      countryListTheme: const CountryListThemeData(bottomSheetHeight: 500),
      context: Get.context!,
      onSelect: (Country value) {
        country.value = value;
      },
    );
  }
}
