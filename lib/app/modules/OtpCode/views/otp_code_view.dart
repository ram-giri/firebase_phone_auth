import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../controllers/otp_code_controller.dart';

class OtpCodeView extends GetView<OtpCodeController> {
  OtpCodeView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter OTP Code'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Pinput(
                controller: controller.cSms,
                length: 6,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return "Please enter all 6 pin number";
                  }
                  return null;
                },
                defaultPinTheme: const PinTheme(
                  textStyle: TextStyle(fontSize: 30),
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2, color: Colors.deepOrange),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.showOverlay(
                        asyncFunction: () async {
                          await controller.verifyOTP();
                        },
                        loadingWidget: const Center(
                          child: CircularProgressIndicator(),
                        ));
                  }
                },
                child: const Text('Verify'),
              ),
              const SizedBox(height: 10),
              const Text("Don't received any code ?"),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: const Text("Resend New Code"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
