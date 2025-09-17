import 'package:flutter/material.dart';
import 'package:todo_list_app_with_category/widgets/app_colors.dart';

class CustomTodoCard extends StatelessWidget {
  final Map<String, dynamic> todo;
  final VoidCallback? onMarkAsDone;
  final VoidCallback? onDelete;
  final bool showMarkAsDone; 

  const CustomTodoCard({
    super.key,
    required this.todo,
    this.onMarkAsDone,
    this.onDelete,
    this.showMarkAsDone = true, // default true
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
          "${todo['description'] ?? ''}\n${todo['category'] ?? ''}\n${todo['date'] ?? ''}",
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        trailing: Wrap(
          spacing: 8,
          children: [
            if (showMarkAsDone && onMarkAsDone != null) // tampilkan centang hanya jika true
              IconButton(
                icon: const Icon(Icons.check, color: AppColors.success),
                onPressed: onMarkAsDone,
              ),
            if (onDelete != null)
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