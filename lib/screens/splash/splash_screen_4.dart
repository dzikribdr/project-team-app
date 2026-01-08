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
        Text(
          "Evan",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 9, 247, 235).withOpacity(0.1), // Isi teks sangat samar
          ),
        ),
      ],
    ),
    const SizedBox(width: 8),

     // ALFEUS (Polos - Putih Tulang agar tidak terlalu kontras)
    const Text(
      "Alfeus",
      style: TextStyle(
        fontSize: 24,
        color: Colors.white70, 
        fontWeight: FontWeight.w300,
      ),
    ),
    const SizedBox(width: 8),

     // HENDRI (Modern Border - Tetap Cyan tapi tipis)
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 9, 247, 235).withOpacity(0.5), 
          width: 1
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: const Text(
        "Hendri",
        style: TextStyle(
          fontSize: 24,
          color: Color.fromARGB(255, 9, 247, 235),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),
const SizedBox(height: 10),

                          // TI23SE1
                          const Text(
                            "TI23SE1",
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 15),