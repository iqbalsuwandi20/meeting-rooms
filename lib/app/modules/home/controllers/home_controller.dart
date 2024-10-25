import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
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
}
