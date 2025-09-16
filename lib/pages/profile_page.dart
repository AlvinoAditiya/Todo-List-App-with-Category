import 'package:flutter/material.dart';
import 'package:todo_list_app_with_category/widgets/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          SizedBox(height: 30),
          UserCard(
            name: "Arya",
            role: "UI Developer",
            email: "arya@example.com",
          ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: const [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Our Team",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              UserCard(
                name: "Arya",
                role: "UI Developer",
                email: "arya@example.com",
              ),
              SizedBox(height: 20),
              UserCard(
                name: "Alvino",
                role: "Controller Developer",
                email: "alvino@example.com",
              ),
              SizedBox(height: 10),
              UserCard(
                name: "Mikhael",
                role: "Reusable Page Developer",
                email: "mikhael@example.com",
                imagePath: "asset/Mikhael.jpg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
