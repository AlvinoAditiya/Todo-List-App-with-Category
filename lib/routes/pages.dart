import 'package:get/route_manager.dart';
import 'package:todo_list_app_with_category/bindings/dashboard_binding.dart';
import 'package:todo_list_app_with_category/bindings/login_binding.dart';
import 'package:todo_list_app_with_category/bindings/splashcreen_binding.dart';
import 'package:todo_list_app_with_category/pages/dashboard_page.dart';
import 'package:todo_list_app_with_category/pages/history_page.dart';
import 'package:todo_list_app_with_category/pages/home_page.dart';
import 'package:todo_list_app_with_category/pages/login_page.dart';
import 'package:todo_list_app_with_category/pages/profile_page.dart';
import 'package:todo_list_app_with_category/pages/splashscreen_page.dart';
import 'package:todo_list_app_with_category/routes/routes.dart';

class AppPages{
  static final pages = [
   GetPage(name: AppRoutes.loginpage, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.dashboardpage, page: () => DashboardPage(), binding: DashboardBinding()),
    GetPage(name: AppRoutes.homepage, page: () => HomePage(),binding: DashboardBinding()),
    GetPage(name: AppRoutes.historypage, page: () => HistoryPage(), binding: DashboardBinding()),
    GetPage(name: AppRoutes.profilepage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.splashscreen, page: () => SplashScreenPage(), binding: SplashScreenBinding()),
  ];
}
