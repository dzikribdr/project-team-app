import 'dart:ui';
import 'package:flutter/material.dart';

class DetailEvanScreen extends StatelessWidget {
  const DetailEvanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Dekoratif
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'PROFILE MAHASISWA',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30,
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
                          children: const [
                            _ProfileAvatar(),
                            SizedBox(height: 20),
                            _ProfileName(),
                            SizedBox(height: 10),
                            _ProfileClass(),
                            SizedBox(height: 15),
                            _ProfileNIM(),
                            SizedBox(height: 15),
                            _ProfileBio(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Tombol Back
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 20,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          foregroundColor: Colors.black,
                        ),
                        child: const Text(
                          'Back',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ================== WIDGET KECIL (BIAR RAPI) ================== */

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar();

  @override
  Widget build(BuildContext context) {
    return Container(
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
        backgroundImage: AssetImage("assets/images/imagevan.png"),
      ),
    );
  }
}

class _ProfileName extends StatelessWidget {
  const _ProfileName();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Evan",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.cyanAccent,
          ),
        ),
        SizedBox(width: 8),
        Text(
          "Alfeus",
          style: TextStyle(fontSize: 24, color: Colors.white70),
        ),
        SizedBox(width: 8),
        Text(
          "Hendri",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.cyanAccent,
          ),
        ),
      ],
    );
  }
}

class _ProfileClass extends StatelessWidget {
  const _ProfileClass();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "TI23SE1",
      style: TextStyle(
        fontSize: 26,
        color: Colors.amber,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _ProfileNIM extends StatelessWidget {
  const _ProfileNIM();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "1123150186",
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _ProfileBio extends StatelessWidget {
  const _ProfileBio();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Mahasiswa Semester 5 Belajar Flutter.',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white70),
    );
  }
}
