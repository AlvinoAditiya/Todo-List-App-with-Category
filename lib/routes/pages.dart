import 'package:get/route_manager.dart';
import 'package:todo_list_app_with_category/pages/dashboard_page.dart';
import 'package:todo_list_app_with_category/pages/login_page.dart';
import 'package:todo_list_app_with_category/routes/routes.dart';

class AppPages{
  static final pages = [
    GetPage(name: AppRoutes.loginpage, page: ()=> LoginPage()),
    GetPage(name: AppRoutes.dashboardpage, page: ()=> DashboardPage()),
  ];
}