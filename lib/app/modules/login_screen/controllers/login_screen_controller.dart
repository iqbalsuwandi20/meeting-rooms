import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';

class LoginScreenController extends GetxController {
  TextEditingController emailC = TextEditingController(text: "yosi@gmail.com");
  TextEditingController passC = TextEditingController(text: "password");

  RxBool isLoading = false.obs;
  RxBool isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    isLoading.value = true;

    // URL API
    final url = Uri.parse('https://uat-api.ftlgym.com/api/v1/test/login');

    // Data yang akan dikirim ke API
    final body = {
      'email': emailC.text,
      'password': passC.text,
    };

    try {
      // Melakukan POST request ke API
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      // Cek status response dari server
      if (response.statusCode == 200) {
        // Jika sukses, proses responsenya
        final data = jsonDecode(response.body);
        print('Login Berhasil: ${data['message']}');
        // Lanjutkan ke halaman berikutnya atau tampilkan pesan sukses

        Get.toNamed(Routes.HOME);
        Get.snackbar('Login Berhasil', 'Selamat datang di Ruangan Meeting');
      } else {
        // Jika gagal, tampilkan pesan error
        print('Login Gagal: ${response.body}');
        Get.snackbar('Login Gagal', 'Cek kembali email dan password Anda.');
      }
    } catch (e) {
      // Menangani jika ada error saat melakukan request
      print('Error: $e');
      Get.snackbar('Error', 'Tidak dapat terhubung ke server.');
    } finally {
      // Selesai loading
      isLoading.value = false;
    }
  }
}
