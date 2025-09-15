import 'package:flutter/material.dart';
import 'home_page.dart';
import 'history_page.dart';
import 'profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  // Buat model reusable untuk halaman dashboard
  final List<_DashboardItem> _items = const [
    _DashboardItem(page: HomePage(), title: "Home", icon: Icons.home),
    _DashboardItem(page: HistoryPage(), title: "History", icon: Icons.history),
    _DashboardItem(page: ProfilePage(), title: "Profile", icon: Icons.person),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = _items[_selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentItem.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: currentItem.page,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: _items
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: Icon(item.icon),
                    label: item.title,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

// Model reusable untuk dashboard item
class _DashboardItem {
  final Widget page;
  final String title;
  final IconData icon;

  const _DashboardItem({
    required this.page,
    required this.title,
    required this.icon,
  });
}
