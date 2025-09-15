import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/history_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller dibuat permanent biar tidak hilang
    final HistoryController historyC = Get.put(HistoryController(), permanent: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("History Todo"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              if (historyC.historyList.isEmpty) {
                Get.snackbar("Info", "Tidak ada todo di history",
                    snackPosition: SnackPosition.BOTTOM);
                return;
              }
              Get.defaultDialog(
                title: "Hapus Semua",
                middleText: "Apakah kamu yakin ingin menghapus semua todo di history?",
                textCancel: "Batal",
                textConfirm: "Hapus",
                confirmTextColor: Colors.white,
                onConfirm: () {
                  historyC.clearHistory();
                  Get.back();
                },
              );
            },
          )
        ],
      ),
      body: Obx(() {
        if (historyC.historyList.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada todo selesai",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: historyC.historyList.length,
          itemBuilder: (context, index) {
            final todo = historyC.historyList[index];
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: ListTile(
                title: Text(
                  todo['title'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  "${todo['category'] ?? ''}\n${todo['date'] ?? ''}", // ✅ tampilkan tanggal
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => historyC.deleteHistoryAt(index),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
