import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:project_jasun/screens/auth/login_screen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Opsional: Tetap ada timer otomatis 5 detik, atau matikan jika ingin manual klik tombol
    _timer = Timer(const Duration(seconds: 30), () {
      _navigateToLogin();
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Matikan timer jika user pindah halaman sebelum waktu habis
    super.dispose();
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }