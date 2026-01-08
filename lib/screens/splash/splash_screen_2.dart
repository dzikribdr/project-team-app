import 'dart:async';
import 'package:flutter/material.dart';
import 'splash_screen_3.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SplashScreen3()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF0F2027)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Text(
            "VAPE\nVIOLENCE",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.9),
              shadows: const [
                Shadow(color: Colors.cyanAccent, blurRadius: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
