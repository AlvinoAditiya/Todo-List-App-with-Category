import 'package:flutter/material.dart';
import 'package:todo_list_app_with_category/pages/responsive/responsive_layout.dart';
import 'home_mobile.dart';
import 'home_web.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: HomeMobile(),
      tabletBody: HomeWeb(),
      desktopBody: HomeWeb(),
    );
  }
}
