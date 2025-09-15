import 'package:get/get.dart';

class HistoryController extends GetxController {
  final RxList<Map<String, dynamic>> historyList = <Map<String, dynamic>>[].obs;

  void addHistory(Map<String, dynamic> todo) {
    historyList.add(todo);
    historyList.refresh();
  }

  void deleteHistory(Map<String, dynamic> todo) {
    historyList.remove(todo);
    historyList.refresh();
  }

  void deleteHistoryAt(int index) {
    if (index >= 0 && index < historyList.length) {
      historyList.removeAt(index);
      historyList.refresh();
    }
  }

  void clearHistory() {
    historyList.clear();
    historyList.refresh();
  }
}
