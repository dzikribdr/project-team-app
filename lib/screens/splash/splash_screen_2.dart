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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryColor, // Background App
      body: Center(
        child: Container(
          width: 300, // Sesuai CSS width: 300px
          // height: 450, // Bisa auto height atau fixed
          decoration: BoxDecoration(
            color: Colors.white, // --bg-color: #fff
            borderRadius: BorderRadius.circular(20), // border-radius: 20px
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,