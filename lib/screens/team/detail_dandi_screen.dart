import 'package:flutter/material.dart';
import 'package:project_jasun/core/constants.dart'; // Pastikan path ini sesuai

class DetailDandiScreen extends StatelessWidget {
  const DetailDandiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryColor, // Background App
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      // Menggunakan SingleChildScrollView agar aman jika layar HP kecil
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 300, // Sesuai CSS width: 300px
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
                    children: [
                      // --- 1. CARD IMG (HEADER) ---
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFFC726E),
                                Color(0xFFFFC3A0),
                              ],
                            ),
                          ),
                          child: const Icon(Icons.school, size: 80, color: Colors.white24),
                        ),
                      ),

                      // --- SPACING UNTUK AVATAR ---
                      const SizedBox(height: 60),

                      // --- 2. TEXT CONTENT ---
                      const Text(
                        "Dandi Taufiqurrahman",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Subtitle: NIM & Jurusan
                      const Text(
                        "NIM: 1123150054",
                        style: TextStyle(fontSize: 14, color: Color(0xFF78858F)),
                      ),
                      const Text(
                        "Software Engineer-1 ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Color(0xFF78858F)),
                      ),
                      const Text(
                        "Flutter - Admin Dashboard",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Color(0xFF78858F)),
                      ),

                      const SizedBox(height: 24),

                      // --- 3. BUTTONS ---
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Tombol 1: Outlined (Info)
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  // Tambahkan aksi info di sini jika perlu
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.black, width: 2),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                                child: const Text("INFO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                              ),
                            ),

                            const SizedBox(width: 12),

                            // Tombol 2: Solid (Kembali)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Aksi Kembali ke Team Screen
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  elevation: 0,
                                ),
                                child: const Text("KEMBALI", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // --- 4. AVATAR (FLOATING) ---
                  Positioned(
                    top: 90,
                    child: Container(
                      width: 114,
                      height: 114,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/dandi.jpeg'),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}