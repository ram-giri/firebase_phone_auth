import 'package:get/get.dart';

import '../controllers/otp_code_controller.dart';

class OtpCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpCodeController>(
      () => OtpCodeController(),
    );
  }
}
