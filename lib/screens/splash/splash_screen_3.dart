import 'dart:async';
import 'package:flutter/material.dart';
import 'splash_screen_4.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SplashScreen4()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Flavor • Cloud • Style",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white70,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}