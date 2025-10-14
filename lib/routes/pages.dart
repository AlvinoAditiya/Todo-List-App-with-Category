import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/home_controller.dart';
import 'package:todo_list_app_with_category/controller/login_controller.dart';
import 'package:todo_list_app_with_category/controller/splashscreen_controller.dart';
import 'package:todo_list_app_with_category/controller/dashboard_controller.dart';
import 'package:todo_list_app_with_category/controller/profile_controller.dart';
import 'package:todo_list_app_with_category/pages/dashboard_page.dart';
import 'package:todo_list_app_with_category/pages/login_page.dart';
import 'package:todo_list_app_with_category/pages/splashscreen_page.dart';
import 'package:todo_list_app_with_category/pages/profile_page.dart';
import 'package:todo_list_app_with_category/pages/home_page.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.loginpage,
      page: () => LoginPage(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
    GetPage(
      name: AppRoutes.splashscreenpage,
      page: () => SplashScreenPage(),
      binding: BindingsBuilder(() {
        Get.put(SplashScreenController());
      }),
    ),
    GetPage(
      name: AppRoutes.dashboardpage,
      page: () => DashboardPage(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: BindingsBuilder(() {
        Get.put(ProfileController());
      }),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: BindingsBuilder(() {
        Get.put(HomeController()); 
      }),
    ),
  ];
}
