import 'package:get/get.dart';

class HistoryController extends GetxController {
  /// List untuk menyimpan todo yang sudah selesai
  final RxList<Map<String, dynamic>> historyList = <Map<String, dynamic>>[].obs;

  /// Menambahkan todo ke history
  void addHistory(Map<String, dynamic> todo) {
    historyList.add(todo);
    historyList.refresh();
  }

  /// Menghapus todo dari history
  void deleteHistory(Map<String, dynamic> todo) {
    historyList.remove(todo);
    historyList.refresh();
  }

  /// Menghapus todo di history berdasarkan index
  void deleteHistoryAt(int index) {
    if (index >= 0 && index < historyList.length) {
      historyList.removeAt(index);
      historyList.refresh();
    }
  }

  /// Menghapus semua data di history
  void clearHistory() {
    historyList.clear();
    historyList.refresh();
  }
}
