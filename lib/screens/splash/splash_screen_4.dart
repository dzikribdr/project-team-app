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

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Title Tetap Sesuai Kode Awal
                const Text(
                  'PROFILE MAHASISWA',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 20),

                 // Card Glassmorphism
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 1.5,
                        ),
                      ),
                       child: Column(
                        children: [
                          // Foto dengan Ring Glow
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [Colors.cyanAccent, Colors.amber],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.cyanAccent.withOpacity(0.3),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 64,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage("../assets/image/vans.jpeg"),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Nama Satu Baris (Evan Alfeus Hendri) dengan Desain Berbeda
                          Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    // EVAN (Stroke Style - Dibuat lebih soft/redup)
    Stack(
      children: [
        Text(
          "Evan",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.2 // Garis diperhalus
              ..color = const Color.fromARGB(255, 9, 247, 235).withOpacity(0.4), // Opacity diturunkan jadi 0.4
          ),
        ),