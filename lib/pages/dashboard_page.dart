import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/dashboard_controller.dart';
import 'package:todo_list_app_with_category/widgets/app_colors.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final dashboardController = Get.find<DashboardController>();
  final List<String> _titles = ["Home", "History", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(_titles[dashboardController.selectedIndex.value]),
            backgroundColor: AppColors.primary,
          body: dashboardController.pages[dashboardController.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: dashboardController.selectedIndex.value,
            onTap: dashboardController.changePage,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: _items
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: Icon(item.icon),
                    label: item.title,
                  ),
                )
                .toList(),
          ),
        ));

        ),
      ),
    );
  }
}

// Model reusable untuk dashboard item
class _DashboardItem {
  final Widget page;
  final String title;
  final IconData icon;

  const _DashboardItem({
    required this.page,
    required this.title,
    required this.icon,
  });
}
