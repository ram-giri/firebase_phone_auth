import 'package:get/get.dart';
import '../modules/OtpCode/bindings/otp_code_binding.dart';
import '../modules/OtpCode/views/otp_code_view.dart';
import '../modules/Phone/bindings/phone_binding.dart';
import '../modules/Phone/views/phone_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/signinorcreate/bindings/signinorcreate_binding.dart';
import '../modules/signinorcreate/views/signinorcreate_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';
import '../modules/userDetail/bindings/user_name_binding.dart';
import '../modules/userDetail/views/user_name_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SIGNINORCREATE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PHONE,
      page: () => PhoneView(),
      binding: PhoneBinding(),
    ),
    GetPage(
      name: _Paths.OTP_CODE,
      page: () => OtpCodeView(),
      binding: OtpCodeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNINORCREATE,
      page: () => const SigninorcreateView(),
      binding: SigninorcreateBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => const UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.USER_NAME,
      page: () => UserNameView(),
      binding: UserNameBinding(),
    ),
  ];
}
