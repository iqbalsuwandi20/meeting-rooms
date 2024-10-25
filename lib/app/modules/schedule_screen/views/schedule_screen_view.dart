import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/schedule_screen_controller.dart';

class ScheduleScreenView extends GetView<ScheduleScreenController> {
  const ScheduleScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScheduleScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ScheduleScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
