import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kb1179_1123150186_uts/screen/splash_screen_3.dart'; // Import aslimu

class MySplashScreen2 extends StatelessWidget {
  const MySplashScreen2({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Dekoratif (Glow di pojok)
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber.withOpacity(0.15),
              ),
            ),
          ),