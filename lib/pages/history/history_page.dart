import 'package:flutter/material.dart';
import 'package:todo_list_app_with_category/pages/responsive/responsive_layout.dart';
import 'history_mobile.dart';
import 'history_web.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: HistoryMobile(),
      tabletBody: HistoryWeb(),
      desktopBody: HistoryWeb(),
    );
  }
}
