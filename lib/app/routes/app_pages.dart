import 'package:get/get.dart';

import '../data/services/auth_service.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/city_selector/bindings/city_selector_binding.dart';
import '../modules/city_selector/views/city_selector_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/inbox/bindings/inbox_binding.dart';
import '../modules/inbox/views/inbox_view.dart';
import '../modules/loading/bindings/loading_binding.dart';
import '../modules/loading/views/loading_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_vehicles/bindings/my_vehicles_binding.dart';
import '../modules/my_vehicles/views/my_vehicles_view.dart';
import '../modules/my_vehicles/views/vehicle_form_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/edit_profile_view.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL =
      Get.find<AuthService>().isLoggedIn ? Routes.HOME : Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.LOADING,
      page: () => const LoadingView(),
      binding: LoadingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MY_VEHICLES,
      page: () => const MyVehiclesView(),
      binding: MyVehiclesBinding(),
    ),
    GetPage(
      name: _Paths.VEHICLE_FORM,
      page: () => const VehicleFormView(),
      binding: MyVehiclesBinding(),
    ),
    GetPage(
      name: _Paths.INBOX,
      page: () => const InboxView(),
      binding: InboxBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.CITY_SELECTOR,
      page: () => const CitySelectorView(),
      binding: CitySelectorBinding(),
      transition: Transition.fade,
    ),
  ];
}
