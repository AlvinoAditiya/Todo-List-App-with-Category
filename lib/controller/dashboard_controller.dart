import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Observable untuk index halaman
  var selectedIndex = 0.obs;

  // Fungsi untuk update halaman
  void changePage(int index) {
    selectedIndex.value = index;
  }
}
