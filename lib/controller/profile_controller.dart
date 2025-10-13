import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app_with_category/pages/login_page.dart';

class ProfileController extends GetxController{
   final users = [
    {
      "name": "Arya",
      "role": "UI Developer",
      "email": "arya@gmail.com",
      "image": "assets/images/arya.jpg",
    },
    {
      "name": "Alvino",
      "role": "Controller Developer",
      "email": "alvino@gmail.com",
      "image": "assets/images/vino.jpg",
    },
    {
      "name": "Mikhael",
      "role": "Reusable Page Developer",
      "email": "mikhael@gmail.com",
      "image": "",
    },
  ];

  void logout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // bisa clear semua data login/session

  // Navigasi ke LoginPage langsung (tidak perlu route bernama)
  Get.offAll(() => LoginPage());
}

}