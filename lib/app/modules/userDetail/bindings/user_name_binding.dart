import 'package:get/get.dart';

import '../controllers/user_name_controller.dart';

class UserNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserNameController>(
      () => UserNameController(),
    );
  }
}
