part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const OTP = _Paths.OTP;
  static const LOADING = _Paths.LOADING;
  static const MY_VEHICLES = _Paths.MY_VEHICLES;
  static const INBOX = _Paths.INBOX;
  static const VEHICLE_FORM = _Paths.VEHICLE_FORM;

  //Profile Paths
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const PROFILE = _Paths.PROFILE;
  static const CHAT = _Paths.CHAT;
  static const CITY_SELECTOR = _Paths.CITY_SELECTOR;
}

abstract class _Paths {
  _Paths._();

  static const HOME = '/home';
  static const LOGIN = '/login';
  static const OTP = '/otp';
  static const LOADING = '/loading';
  static const INBOX = '/inbox';

  //Vehicles Paths
  static const MY_VEHICLES = '/my-vehicles';
  static const VEHICLE_FORM = "/vehicle-form";

  //Profile Paths
  static const PROFILE = '/profile';
  static const EDIT_PROFILE = '/edit-profile';
  static const CHAT = '/chat';
  static const CITY_SELECTOR = '/city-selector';
}
