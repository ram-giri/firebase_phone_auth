import 'dart:developer';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_app/app/routes/app_pages.dart';

class AuthService extends GetxService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var _verificationId = '';
  var _userId = '';
  String get verificationID => _verificationId;
  String get userId => _userId;

  Future createUser(phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          User? user = (await auth.signInWithCredential(credential)).user;
          if (user != null) {
            _userId = user.uid;
            Get.offNamed(Routes.HOME, arguments: {"userId": userId});
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('error', "The Provide phone number is not valid",
                snackPosition: SnackPosition.BOTTOM);
          }
        },
        codeSent: ((verificationId, forceResendingToken) {
          _verificationId = verificationId;
          Get.toNamed(Routes.OTP_CODE);
        }),
        codeAutoRetrievalTimeout: ((verificationId) {}),
        timeout: const Duration(minutes: 2),
      );
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }
}
