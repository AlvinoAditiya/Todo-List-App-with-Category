import 'package:flutter/material.dart';
import 'package:todo_list_app_with_category/pages/responsive/responsive_layout.dart';
import 'profile_mobile.dart';
import 'profile_web.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: ProfileMobile(),
      tabletBody: ProfileWeb(),
      desktopBody: ProfileWeb(),
    );
  }
}
