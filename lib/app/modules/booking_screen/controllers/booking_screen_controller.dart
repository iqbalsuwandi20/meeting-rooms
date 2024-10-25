import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingScreenController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  RxBool isButtonSuccessVisible = false.obs;

  final List<String> divisiRooms = [
    "Mobile Developer Room",
    "Web Developer Room",
  ];

  final List<String> meetingRooms = [
    "Squats Room",
    "Lunges Room",
  ];

  void moveSuccessButton() {
    isButtonSuccessVisible.value = true;
    Future.delayed(Duration(seconds: 3), () {
      isButtonSuccessVisible.value = false;
    });
  }

  void onDivisiRoomChanged(String? room) {}

  void onMeetingRoomChanged(String? room) {}

  Future<void> selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      dateController.text = formattedDate;
    }
  }

  Future<void> selectStartTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      String formattedTime = selectedTime.format(context);
      startTimeController.text = formattedTime;
    }
  }

  Future<void> selectEndTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      String formattedTime = selectedTime.format(context);
      endTimeController.text = formattedTime;
    }
  }
}
