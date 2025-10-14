import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController()); 
    
    return Obx(() => Scaffold(
          body: controller.pages[controller.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changePage,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ));
  }
}
