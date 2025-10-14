import 'package:flutter/material.dart';
import 'package:todo_list_app_with_category/pages/history/history_page.dart';

class HistoryResponsive extends StatelessWidget {
  const HistoryResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return const HistoryPage();
    } else if (width < 1024) {
      return Scaffold(
        body: Row(
          children: const [
            Expanded(flex: 2, child: HistoryPage()),
            Expanded(
              flex: 3,
              child: Center(
                child: Text("Tablet Mode – Riwayat Detail"),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Row(
          children: const [
            Expanded(flex: 2, child: HistoryPage()),
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  "Web Mode – Detail History View",
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
