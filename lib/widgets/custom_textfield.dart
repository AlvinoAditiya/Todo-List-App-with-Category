import 'package:flutter/material.dart';
import 'package:todo_list_app_with_category/widgets/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.secondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.secondary),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
