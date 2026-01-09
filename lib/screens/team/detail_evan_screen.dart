import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
// Pastikan path import ini sesuai dengan lokasi file splash_screen_5.dart kamu
import 'splash_screen_5.dart';

class SplashScreen4 extends StatefulWidget {
  const SplashScreen4({super.key});

  @override
  State<SplashScreen4> createState() => _SplashScreen4State();
}

class _SplashScreen4State extends State<SplashScreen4> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Timer 5 detik, lalu masuk ke Splash 5 (Elegant)
    _timer = Timer(const Duration(seconds: 5), () {
      _navigateToNext();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _navigateToNext() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        // Di sini kita arahkan ke Splash Screen 5 (Elegant)
        MaterialPageRoute(builder: (context) => const SplashScreen5()),
      );
    }
  }

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
                          children: [
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
                                backgroundImage: AssetImage(
                                  "assets/images/imagevan.png",
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildNameEvan(),
                                const SizedBox(width: 8),
                                const Text(
                                  "Alfeus",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                _buildNameHendri(),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "TI23SE1",
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            _buildNIMBox(),
                            const SizedBox(height: 15),
                            _buildBioBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 20,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed:
                            _navigateToNext, // Panggil fungsi navigasi ke Splash 5
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          foregroundColor: Colors.black,
                        ),
                        child: const Text(
                          'Gasken Continue',
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

  Widget _buildNameEvan() {
    return const Text(
      "Evan",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.cyanAccent,
      ),
    );
  }

  Widget _buildNameHendri() {
    return const Text(
      "Hendri",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.cyanAccent,
      ),
    );
  }

  Widget _buildNIMBox() {
    return const Text(
      "1123150186",
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildBioBox() {
    return const Text(
      'Mahasiswa Semester 5 Belajar Flutter.',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white70),
    );
  }
}