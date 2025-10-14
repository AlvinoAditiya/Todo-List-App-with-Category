import 'package:flutter/material.dart';
import 'package:todo_list_app_with_category/pages/home/home_page.dart';

class HomeResponsive extends StatelessWidget {
  const HomeResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      // Mobile
      return const HomePage();
    } else if (screenWidth < 1024) {
      // Tablet
      return Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue[50],
                child: const Center(
                  child: Text(
                    "Menu",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const Expanded(flex: 5, child: HomePage()),
          ],
        ),
      );
    } else {
      // Web
      return Scaffold(
        body: Row(
          children: const [
            Expanded(flex: 2, child: HomePage()),
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  "Detail View (Web Mode)",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
