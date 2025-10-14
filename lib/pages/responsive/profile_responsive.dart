import 'package:flutter/material.dart';
import 'package:todo_list_app_with_category/pages/profile/profile_page.dart';

class ProfileResponsive extends StatelessWidget {
  const ProfileResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      return ProfilePage();
    } else if (screenWidth < 1024) {
      return Scaffold(
        body: Row(
          children: [
            Expanded(flex: 2, child: ProfilePage()),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blueGrey[50],
                child: const Center(
                  child: Text(
                    "Tablet Mode – Detail User",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Row(
          children: [
            Expanded(flex: 2, child: ProfilePage()),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    "Web Mode – Profil Detail",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
