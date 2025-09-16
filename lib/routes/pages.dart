import 'package:get/route_manager.dart';
import 'package:todo_list_app_with_category/bindings/main_binding.dart';
import 'package:todo_list_app_with_category/pages/dashboard_page.dart';
import 'package:todo_list_app_with_category/pages/history_page.dart';
import 'package:todo_list_app_with_category/pages/home_page.dart';
import 'package:todo_list_app_with_category/pages/login_page.dart';
import 'package:todo_list_app_with_category/pages/profile_page.dart';
import 'package:todo_list_app_with_category/routes/routes.dart';

class AppPages{
  static final pages = [
   GetPage(name: AppRoutes.loginpage, page: () => LoginPage()),
    GetPage(name: AppRoutes.dashboardpage, page: () => DashboardPage()),
    GetPage(name: AppRoutes.homepage, page: () => HomePage()),
    GetPage(name: AppRoutes.historypage, page: () => HistoryPage()),
    GetPage(name: AppRoutes.profilepage, page: () => ProfilePage()),
  ];
}
