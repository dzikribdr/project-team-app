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