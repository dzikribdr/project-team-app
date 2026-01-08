import 'package:flutter/material.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:project_jasun/screens/auth/login_screen.dart';

class SplashScreen6 extends StatelessWidget {
  const SplashScreen6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppConstants.primaryColor,
              Color(0xFF0F2027),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cloud,
                  size: 120,
                  color: AppConstants.cyanColor,
                ),
                const SizedBox(height: 24),
                const Text(
                  "VAPE VIOLENCE",
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                 const SizedBox(height: 10),
                const Text(
                  "Premium Vape Store Experience",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstants.cyanColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),