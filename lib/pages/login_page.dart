import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/login_controller.dart';
import 'package:todo_list_app_with_category/widgets/custom_button.dart';
import 'package:todo_list_app_with_category/widgets/app_colors.dart';
import 'package:todo_list_app_with_category/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Username",
                controller: loginController.usernameC,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hint: "Password",
                controller: loginController.passwordC,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Login",
                onPressed: loginController.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
