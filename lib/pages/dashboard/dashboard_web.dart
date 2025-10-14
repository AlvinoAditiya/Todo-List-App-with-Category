import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/dashboard_controller.dart';
import 'package:todo_list_app_with_category/widgets/app_colors.dart';

class DashboardWeb extends StatelessWidget {
  const DashboardWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Obx(() => Scaffold(
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: controller.changePage,
                backgroundColor: AppColors.primary,
                selectedIconTheme: const IconThemeData(color: Colors.white),
                unselectedIconTheme:
                    const IconThemeData(color: Colors.white60),
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.history),
                    label: Text('History'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text('Profile'),
                  ),
                ],
              ),
              Expanded(
                child: controller.pages[controller.selectedIndex.value],
              ),
            ],
          ),
        ));
  }
}
