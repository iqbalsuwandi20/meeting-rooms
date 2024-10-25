import 'package:get/get.dart';

import '../controllers/schedule_screen_controller.dart';

class ScheduleScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleScreenController>(
      () => ScheduleScreenController(),
    );
  }
}
