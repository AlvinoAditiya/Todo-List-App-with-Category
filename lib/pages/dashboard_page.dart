import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/dashboard_controller.dart';
import 'package:todo_list_app_with_category/pages/home_page.dart';
import 'package:todo_list_app_with_category/pages/history_page.dart';
import 'package:todo_list_app_with_category/pages/profile_page.dart';
import 'package:todo_list_app_with_category/widgets/app_colors.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pages = [
        const HomePage(),
        const HistoryPage(),
        const ProfilePage(),
      ];

      return Scaffold(
        body: pages[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: dashboardController.changePage,
          selectedItemColor: AppColors.primary, // konsisten pakai AppColors
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
