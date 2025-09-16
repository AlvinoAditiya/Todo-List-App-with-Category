import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/history_controller.dart';
import '../widgets/custom_todo_card.dart';
import '../widgets/app_colors.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historyController = Get.find<HistoryController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("History Todo"),
        backgroundColor: AppColors.secondary,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              if (historyController.historyList.isEmpty) {
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
                  historyController.clearHistory();
                  Get.back();
                },
              );
            },
          )
        ],
      ),
      body: Obx(() {
        if (historyController.historyList.isEmpty) {
          return const Center(
            child: Text("Belum ada todo selesai",
                style: TextStyle(fontSize: 18, color: Colors.grey)),
          );
        }
        return ListView.builder(
          itemCount: historyController.historyList.length,
          itemBuilder: (context, index) {
            final todo = historyController.historyList[index];
            return CustomTodoCard(
              todo: todo,
              onMarkAsDone: () {},
              onDelete: () => historyController.deleteHistoryAt(index),
            );
          },
        );
      }),
    );
  }
}
