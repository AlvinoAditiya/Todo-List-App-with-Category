import 'package:flutter/material.dart';

class HistoryMobile extends StatelessWidget {
  const HistoryMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History")),
      body: const Center(
        child: Text("Riwayat Aktivitas Kamu (Mobile)",
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
