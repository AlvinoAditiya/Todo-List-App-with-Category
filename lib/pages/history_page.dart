import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // Simpan history todo langsung di sini
  List<Map<String, String>> historyList = [];

  void deleteHistoryAt(int index) {
    setState(() {
      historyList.removeAt(index);
    });
  }

  void clearHistory() {
    setState(() {
      historyList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Todo"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              if (historyList.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Tidak ada todo di history")),
                );
                return;
              }
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Hapus Semua"),
                  content: const Text(
                    "Apakah kamu yakin ingin menghapus semua todo di history?",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Batal"),
                    ),
                    TextButton(
                      onPressed: () {
                        clearHistory();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Hapus",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: historyList.isEmpty
          ? const Center(
              child: Text(
                "Belum ada todo selesai",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, index) {
                final todo = historyList[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  child: ListTile(
                    title: Text(
                      todo['title'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(todo['category'] ?? ''),
                        const SizedBox(height: 4),
                        if (todo['description'] != null)
                          Text(
                            todo['description']!,
                            style: const TextStyle(fontSize: 12),
                          ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteHistoryAt(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
