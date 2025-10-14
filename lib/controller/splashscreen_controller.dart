import 'package:get/get.dart';
import 'package:todo_list_app_with_category/routes/routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToDashboard();
  }

  void _navigateToDashboard() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.dashboardpage);
  }
}
