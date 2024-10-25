import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ScheduleScreenController extends GetxController {
  TextEditingController dateController = TextEditingController();

  final List<String> meetingRooms = [
    "Squats Room",
    "Lunges Room",
  ];

  Stream<List<Map<String, dynamic>>> streamRoomMeeting() async* {
    while (true) {
      final response = await http.get(
          Uri.parse("https://uat-api.ftlgym.com/api/v1/test/jadwalruangan"));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['status'] == 'success' && data['data'] != null) {
          yield List<Map<String, dynamic>>.from(data['data']);
        } else {
          yield [];
        }
      } else {
        yield [];
      }
      await Future.delayed(Duration(minutes: 1));
    }
  }

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
}
