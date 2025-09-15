import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController titleC = TextEditingController();
  final TextEditingController descC = TextEditingController();

  String? kategori;
  String? prioritas;
  DateTime? dueDate;

  void _showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Judul
                  TextField(
                    controller: titleC,
                    decoration: InputDecoration(
                      hintText: "Judul",
                      prefixIcon: const Icon(Icons.title, color: Colors.brown),
                      filled: true,
                      fillColor: Colors.brown[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Deskripsi
                  TextField(
                    controller: descC,
                    decoration: InputDecoration(
                      hintText: "Deskripsi",
                      prefixIcon: const Icon(Icons.description,
                          color: Colors.brown),
                      filled: true,
                      fillColor: Colors.brown[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Pilih Kategori
                  DropdownButtonFormField<String>(
                    value: kategori,
                    items: ["Umum", "Pekerjaan", "Pribadi"]
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() => kategori = value);
                    },
                    decoration: InputDecoration(
                      hintText: "Pilih Kategori",
                      filled: true,
                      fillColor: Colors.brown[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Pilih Prioritas
                  DropdownButtonFormField<String>(
                    value: prioritas,
                    items: ["Rendah", "Sedang", "Tinggi"]
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() => prioritas = value);
                    },
                    decoration: InputDecoration(
                      hintText: "Pilih Prioritas",
                      filled: true,
                      fillColor: Colors.brown[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Due Date
                  TextFormField(
                    readOnly: true,
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        initialDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          dueDate = picked;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      hintText: dueDate == null
                          ? "Pilih Due Date"
                          : "${dueDate!.day}/${dueDate!.month}/${dueDate!.year}",
                      prefixIcon:
                          const Icon(Icons.calendar_today, color: Colors.brown),
                      filled: true,
                      fillColor: Colors.brown[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tombol Simpan
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Simpan todo di sini
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Simpan Todo"),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
