import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/routes/routes.dart';
import '../pages/dashboard_page.dart';

class LoginController extends GetxController {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

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
    if (usernameC.text.trim() == "alvino" && passwordC.text.trim() == "arya") {
      // Pindah halaman ke Dashboard menggunakan named route
      Get.offNamed(AppRoutes.dashboardpage);
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