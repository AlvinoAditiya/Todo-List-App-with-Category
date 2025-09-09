import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController authC = Get.put(LoginController());

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
                const Icon(
                  Icons.check_circle_outline,
                  size: 100,
                  color: Colors.blue,
                ),
                const SizedBox(height: 20),

                const Text(
                  "Todo List App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),

                // Input Username
                CustomTextField(
                  hint: "Username",
                  controller: authC.usernameC,
                ),
                const SizedBox(height: 20),

                // Input Password
                CustomTextField(
                  hint: "Password",
                  controller: authC.passwordC,
                  isPassword: true,
                ),
                const SizedBox(height: 30),

                // Tombol Login
                CustomButton(
                  text: "Login",
                  onPressed: () {
                    authC.login();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
