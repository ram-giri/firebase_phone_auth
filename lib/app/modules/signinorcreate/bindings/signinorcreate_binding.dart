import 'package:get/get.dart';

import '../controllers/signinorcreate_controller.dart';

class SigninorcreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninorcreateController>(
      () => SigninorcreateController(),
    );
  }
}
