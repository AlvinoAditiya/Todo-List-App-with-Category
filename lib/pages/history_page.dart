import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.check, color: Colors.green),
              title: Text("Belajar GetX"),
              subtitle: Text("Kategori: Sekolah"),
            ),
          ),
        ],
      ),
    );
  }
}
