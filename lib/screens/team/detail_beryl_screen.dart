import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_jasun/screens/auth/login_screen.dart';

class SplashScreen6 extends StatefulWidget {
  const SplashScreen6({super.key});

  @override
  State<SplashScreen6> createState() => _SplashScreen6State();
}

class _SplashScreen6State extends State<SplashScreen6> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Timer 30 detik navigasi ke Login
    _timer = Timer(const Duration(seconds: 30), _navigateToLogin);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _navigateToLogin() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Palet Warna: Deep Forest & Gold (Sangat beda dari sebelumnya)
    const Color bgPrimary = Color(0xFF042B2B); // Hijau Tua Gelap
    const Color accentColor = Color(0xFFFFD700); // Emas
    const Color cardColor = Color(0xFF0B3D3D); // Hijau sedikit terang
    const Color textWhite = Colors.white;

    return Scaffold(
      backgroundColor: bgPrimary,
      body: Stack(
        children: [
          // --- 1. DEKORASI BACKGROUND (Lingkaran Pojok Kanan Atas) ---
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: accentColor.withOpacity(0.2),
                  width: 40,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 80,
            child: CircleAvatar(radius: 10, backgroundColor: accentColor),
          ),

          // --- 2. KONTEN UTAMA (Rata Kiri / Bottom aligned) ---
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // POSISI: Rata Kiri
                mainAxisAlignment: MainAxisAlignment.end, // POSISI: Di Bawah
                children: [
                  // Spacer agar konten turun ke bawah
                  const Spacer(),

                  // FOTO PROFIL (Style: Rounded
                  // Square dengan Shadow)
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(5, 5),
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage('assets/images/foto_mahasiswa.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // GARIS AKSEN
                  Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // NAMA & NIM (Typography Modern)
                  const Text(
                    'Hello, I am',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Beryl Rafi\nAgatha', // Nama dipisah baris biar estetik
                    style: TextStyle(
                      color: textWhite,
                      fontSize: 36,
                      fontWeight: FontWeight.w900, // Sangat tebal
                      height: 1.1,
                      fontFamily: 'Serif', // Menggunakan font Serif biar beda
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white12),
                    ),
                    child: const Text(
                      'NIM : 1123150088',
                      style: TextStyle(
                        color: accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const Spacer(),

                  // TOMBOL NAVIGASI (Style: Wide Button)
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: _navigateToLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: textWhite, // Tombol Putih
                        foregroundColor: bgPrimary, // Teks Hijau
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.arrow_right_alt, size: 30),
                        ],
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