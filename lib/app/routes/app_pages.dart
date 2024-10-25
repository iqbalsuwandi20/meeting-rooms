import 'package:get/get.dart';

import '../modules/booking_screen/bindings/booking_screen_binding.dart';
import '../modules/booking_screen/views/booking_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/schedule_screen/bindings/schedule_screen_binding.dart';
import '../modules/schedule_screen/views/schedule_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SCHEDULE_SCREEN,
      page: () => const ScheduleScreenView(),
      binding: ScheduleScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.BOOKING_SCREEN,
      page: () => const BookingScreenView(),
      binding: BookingScreenBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
