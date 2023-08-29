// import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import '../../../models/user_model.dart';
import '../../../services/api_services.dart';

class HomeController extends GetxController {
  AuthUser? user;
  String userId = Get.arguments["userId"];

  getUser() async {
    try {
      user = await FirebseService.getUser(userId);
      // http.Response response = await ApiService.getUser(userId);
      // var decodedResponse = jsonDecode(response.body);
      // if (response.statusCode == 200) {
      //   var data = GetUser.userFromJson(response.body);
      //   user = data;
      // } else if (response.statusCode >= 400 && response.statusCode < 500) {
      //   log(decodedResponse);
      // } else {
      //   throw Exception();
      // }
    } catch (e) {
      log(e.toString());
    }
    return user;
  }
}
