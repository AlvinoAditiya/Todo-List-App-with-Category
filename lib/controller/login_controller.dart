import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/dashboard_page.dart';

class LoginController extends GetxController {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

  // Cuma 1 variabel loading
  var isLoading = false.obs;

  void login() async {
    if (usernameC.text.trim().isEmpty || passwordC.text.trim().isEmpty) {
      Get.snackbar(
        "Login Gagal",
        "Username dan Password tidak boleh kosong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    // Aktifkan loading
    isLoading(true);

    // Simulasi proses login
    await Future.delayed(const Duration(seconds: 2));

    // Dummy login
    if (usernameC.text.trim() == "alvino" && passwordC.text.trim() == "12345") {
      Get.offAll(() => const DashboardPage());
    } else {
      Get.snackbar(
        "Login Gagal",
        "Username atau Password salah",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }

    // Matikan loading
    isLoading(false);
  }

  @override
  void onClose() {
    usernameC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
