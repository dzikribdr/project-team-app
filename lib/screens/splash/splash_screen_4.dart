import 'dart:async';
import 'package:flutter/material.dart';
import 'splash_screen_5.dart';

class SplashScreen4 extends StatefulWidget {
  const SplashScreen4({super.key});

  @override
  State<SplashScreen4> createState() => _SplashScreen4State();
}

class _SplashScreen4State extends State<SplashScreen4> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SplashScreen5()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF141E30)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.local_fire_department,
            size: 120,
            color: Colors.orangeAccent,
          ),
        ),
      ),
    );
  }
}