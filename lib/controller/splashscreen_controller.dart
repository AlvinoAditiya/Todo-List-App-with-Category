import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app_with_category/routes/routes.dart';

class SplashScreenController extends GetxController {
 @override
  void onInit(){
    super.onInit();
    checkLogin(); 
  }

  checkLogin()async{
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed( Duration(seconds: 5));
    if(prefs.getString("username") != null){
      Get.offAllNamed(AppRoutes.dashboardpage);
    }else(){

      Get.offAllNamed(AppRoutes.loginpage);
    };
  }

}
