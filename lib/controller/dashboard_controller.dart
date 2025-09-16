import 'package:get/get.dart';
import 'package:todo_list_app_with_category/pages/history_page.dart';
import 'package:todo_list_app_with_category/pages/home_page.dart';
import 'package:todo_list_app_with_category/pages/profile_page.dart';

class DashboardController extends GetxController {
 
  var selectedIndex = 0.obs;

  final pages = [
    HomePage(),
    HistoryPage(),
    ProfilePage(), 
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}