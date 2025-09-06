import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import 'dashboard_page.dart'; 

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  void login() {
  String username = usernameC.text.trim();
  String password = passwordC.text.trim();

  if (username == "alvino" && password == "12345") {
    Get.offAll(() => const DashboardPage()); 
  } else {
    Get.snackbar(
      "Login Gagal",
      "Username atau Password salah",
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.check_circle_outline,
                    size: 100, color: Colors.blue),
                const SizedBox(height: 20),
                const Text(
                  "Todo List App",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                CustomTextField(
                  hint: "Username",
                  controller: usernameC,
                ),
                const SizedBox(height: 20),

                CustomTextField(
                  hint: "Password",
                  controller: passwordC,
                  isPassword: true,
                ),
                const SizedBox(height: 30),

                CustomButton(
                text: "Login",
              onPressed: login, 
          ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
