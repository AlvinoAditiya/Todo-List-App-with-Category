import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/routes/pages.dart';
import 'package:todo_list_app_with_category/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, 
      ),
      // initialBinding: mainBinding(),
      // initialRoute: AppRoutes.loginpage,
      // getPages: AppPages.pages,

      initialRoute: AppRoutes.loginpage, 
      getPages: AppPages.pages,
    );
  }
}
