import 'package:get/route_manager.dart';
import 'package:todo_list_app_with_category/pages/login_page.dart';
import 'package:todo_list_app_with_category/routes/routes.dart';

class AppPages{
  static final pages = {
    GetPage(name: AppRoutes.login_page, page: ()=> LoginPage()),

  };
}