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
          SizedBox(height: 20),
          UserCard(
            name: "Alvino",
            role: "Controller Developer",
            email: "alvino@example.com",
          ),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String name;
  final String role;
  final String email;

  const UserCard({
    super.key,
    required this.name,
    required this.role,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.secondary.withOpacity(0.1),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.secondary,
              child: Icon(Icons.person, size: 45, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              role,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.email, size: 16, color: AppColors.textSecondary),
                const SizedBox(width: 6),
                Text(
                  email,
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
