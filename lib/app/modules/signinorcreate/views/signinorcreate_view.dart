import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/app/routes/app_pages.dart';
import '../controllers/signinorcreate_controller.dart';

class SigninorcreateView extends GetView<SigninorcreateController> {
  const SigninorcreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'POKEE',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 80),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed(Routes.PHONE);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'SIGN IN WITH PHONE',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 24,
              right: 10,
              left: 10,
              child: Text(
                "By continuing, you agree to Pokee's Terms & condition and confirm you have read Pokee's Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
