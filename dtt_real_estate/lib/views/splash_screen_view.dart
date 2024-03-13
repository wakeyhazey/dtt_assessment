import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffE65541),
      child: Center(child: Image.asset('assets/Images/launcher_icon.png')),
    );
  }
}
