import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app_with_category/controller/profile_controller.dart';
import 'package:todo_list_app_with_category/widgets/app_colors.dart';
import 'package:todo_list_app_with_category/widgets/app_text_styles.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text("PROFILE", style: AppTextStyles.appBarTitle),
    centerTitle: true,
    backgroundColor: AppColors.primary,
    actions: [
      IconButton(
        onPressed: () {
          // Logout dengan konfirmasi
          Get.defaultDialog(
            title: "Logout",
            middleText: "Apakah kamu yakin ingin logout?",
            textConfirm: "Ya",
            textCancel: "Tidak",
            onConfirm: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Get.back(); // tutup dialog
              Get.offAllNamed("/loginpage"); // navigasi ke halaman login
            },
          );
        },
        icon: const Icon(Icons.logout, color: Colors.white), 
        tooltip: "Logout",
      ),
    ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // List Users
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final user = controller.users[index];
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
                          backgroundImage: user['image'] != ""
                              ? AssetImage(user['image']!)
                              : null,
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
                              Text(user["name"]!,
                                  style: AppTextStyles.userName),
                              const SizedBox(height: 4),
                              Text(user["role"]!,
                                  style: AppTextStyles.userRole),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.email,
                                      size: 14,
                                      color: AppColors.textSecondary),
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
          ],
        ),
      ),
    );
  }
}
