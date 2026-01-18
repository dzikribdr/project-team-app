import 'package:flutter/material.dart';

class DetailDzikriScreen extends StatelessWidget {
  const DetailDzikriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bgMain = Color(0xFF0B1120);
    const Color cardBg = Color(0xFF1E293B);
    const Color accentColor = Color(0xFF38BDF8);
    const Color textPrimary = Colors.white;
    const Color textSecondary = Color(0xFF94A3B8);

    return Scaffold(
      backgroundColor: bgMain,
      appBar: AppBar(
        backgroundColor: bgMain,
        elevation: 0,
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topRight: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.05),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(8, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // FOTO
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: accentColor, width: 2),
                  ),
                  child: const CircleAvatar(
                    radius: 52,
                    backgroundImage:
                        AssetImage('assets/images/dzikri.jpeg'),
                    backgroundColor: bgMain,
                  ),
                ),
                const SizedBox(height: 28),

                // NAMA
                const Text(
                  'Dzikri Abdurrahman\nHaris',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),

                Container(width: 30, height: 3, color: accentColor),
                const SizedBox(height: 14),

                // ROLE
                const Text(
                  'SOFTWARE ENGINEER',
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 6),

                // NIM
                const Text(
                  '1123150049',
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 14,
                    fontFamily: 'Monospace',
                  ),
                ),
                const SizedBox(height: 32),

                // BUTTON KEMBALI
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text(
                      'KEMBALI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor,
                      foregroundColor: bgMain,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
