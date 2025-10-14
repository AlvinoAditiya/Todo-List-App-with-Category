import 'package:flutter/material.dart';
import 'package:todo_list_app_with_category/pages/responsive/responsive_layout.dart';
import 'login_mobile.dart';
import 'login_web.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: LoginMobile(),
      tabletBody: LoginWeb(),
      desktopBody: LoginWeb(),
    );
  }
}
