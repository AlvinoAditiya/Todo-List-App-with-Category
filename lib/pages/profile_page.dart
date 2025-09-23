import 'package:flutter/material.dart';
import 'package:todo_list_app_with_category/widgets/app_colors.dart';
import 'package:todo_list_app_with_category/widgets/app_text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      {
        "name": "Arya",
        "role": "UI Developer",
        "email": "arya@gmail.com",
        "image": "assets/images/arya.jpg",
      },
      {
        "name": "Alvino",
        "role": "Controller Developer",
        "email": "alvino@gmail.com",
        "image": "assets/images/vino.jpg",
      },
      {
        "name": "Mikhael",
        "role": "Reusable Page Developer",
        "email": "mikhael@gmail.com",
        "image": "",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFILE", style: AppTextStyles.appBarTitle),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.secondary, AppColors.primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textSecondary.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.background,
                    backgroundImage:
                        user['image'] != "" ? AssetImage(user['image']!) : null,
                    child: user['image'] == ""
                        ? const Icon(Icons.person,
                            color: AppColors.textSecondary, size: 30)
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user["name"]!, style: AppTextStyles.userName),
                        const SizedBox(height: 4),
                        Text(user["role"]!, style: AppTextStyles.userRole),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.email,
                                size: 14, color: AppColors.textSecondary),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                user["email"]!,
                                style: AppTextStyles.userEmail,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
