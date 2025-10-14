import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/splashscreen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashScreenController());

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check_circle, color: Colors.white, size: 100),
            SizedBox(height: 20),
            Text(
              "Loading...",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
