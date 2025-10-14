import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/history_controller.dart';
import '../widgets/custom_todo_card.dart';
import '../widgets/app_colors.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "HISTORY",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
            shadows: [
              Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.black45),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2575FC),
        elevation: 0,
      ),
      body: Obx(() {
        final history = historyController.historyList;

        if (history.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.inbox, size: 80, color: Colors.grey),
                SizedBox(height: 12),
                Text("Belum ada todo selesai", style: TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: history.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final todo = history[index];
            return CustomTodoCard(
              todo: todo,
              onMarkAsDone: null,
              onDelete: () => historyController.deleteHistoryAt(index),
              onEdit: () => historyController.updateTodoDialog(index),
            );
          },
        );
      }),
      floatingActionButton: Obx(() {
        if (historyController.historyList.isEmpty) return const SizedBox();

        return FloatingActionButton.extended(
          backgroundColor: AppColors.error,
          icon: const Icon(Icons.delete_forever, color: Colors.white),
          label: const Text("Hapus Semua", style: TextStyle(color: Colors.white)),
          onPressed: () {
            Get.defaultDialog(
              title: "Hapus Semua",
              middleText: "Apakah kamu yakin ingin menghapus semua todo di history?",
              textCancel: "Batal",
              textConfirm: "Hapus",
              confirmTextColor: Colors.white,
              buttonColor: AppColors.error,
              onConfirm: () async {
                await historyController.clearHistory();
                Get.back();
              },
            );
          },
        );
      }),
    );
  }
}
