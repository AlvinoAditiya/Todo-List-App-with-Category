import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 20),
            const Text("Alvino", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("User Todo List App"),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.offAll(() => LoginPage());
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
