import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/splashscreen_controller.dart';
import 'package:todo_list_app_with_category/widgets/app_colors.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(Icons.check_circle, size: 100, color: Colors.white),

            const SizedBox(height: 20),

            Text(
              "Todo List App",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
