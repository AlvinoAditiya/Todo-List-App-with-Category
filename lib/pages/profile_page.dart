import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mempertahankan struktur data Map<String, String>
    final users = [
      {
        "name": "Arya",
        "role": "UI Developer",
        "email": "arya@gmail.com",
        "image": "assets/images/arya.jpg", // Jalur gambar sudah benar
      },
      {
        "name": "Alvino",
        "role": "Controller Developer",
        "email": "alvino@gmail.com",
        "image": "assets/images/vino.jpg",
      },
      {
        "name": "Mikhael",
        "role": "Reusable Page Developer",
        "email": "mikhael@gmail.com",
        "image": "",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PROFILE",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2575FC),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Penanganan gambar yang lebih aman
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white24,
                    // Menggunakan AssetImage untuk menampilkan gambar
                    // Operator '?' digunakan untuk memeriksa null
                    backgroundImage: user['image'] != null 
                        ? AssetImage(user['image']!) 
                        : null, // Jika null, tidak ada gambar
                    child: user['image'] == null 
                        ? const Icon(Icons.person, color: Colors.white, size: 30) // Tampilkan icon jika gambar tidak ada
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user["name"]!, // Menggunakan '!' karena kita yakin nilainya ada
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user["role"]!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.email,
                              size: 14,
                              color: Colors.white70,
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                user["email"]!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white70,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}