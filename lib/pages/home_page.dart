import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_todo_card.dart';
import '../widgets/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Todo List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.todoList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.inbox, size: 80, color: Colors.grey),
                SizedBox(height: 12),
                Text(
                  "Belum ada todo",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.todoList.length,
          itemBuilder: (context, index) {
            final todo = controller.todoList[index];
            return CustomTodoCard(
              todo: todo,
              onMarkAsDone: () => controller.markAsDone(index),
              onDelete: () => controller.deleteTodoAt(index),
              showMarkAsDone: true, // tombol centang muncul di Home
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          controller.showAddTodoDialog(); 
        },
      ),
    );
  }
}
