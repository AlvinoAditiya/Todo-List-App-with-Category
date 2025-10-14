import 'package:flutter/material.dart';
import 'splashscreen_mobile.dart';

class SplashScreenWeb extends StatelessWidget {
  const SplashScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(width: 500, child: SplashScreenMobile()),
    );
  }
}
