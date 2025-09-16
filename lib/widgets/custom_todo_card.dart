import 'package:flutter/material.dart';
import 'package:todo_list_app_with_category/widgets/app_colors.dart';

class CustomTodoCard extends StatelessWidget {
  final Map<String, dynamic> todo;
  final VoidCallback onMarkAsDone;
  final VoidCallback onDelete;

  const CustomTodoCard({
    super.key,
    required this.todo,
    required this.onMarkAsDone,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        title: Text(
          todo['title'] ?? '',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        subtitle: Text(
          "${todo['category'] ?? ''}\n${todo['date'] ?? ''}",
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        trailing: Wrap(
          spacing: 8,
          children: [
            IconButton(
              icon: const Icon(Icons.check, color: AppColors.success),
              onPressed: onMarkAsDone,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: AppColors.error),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
