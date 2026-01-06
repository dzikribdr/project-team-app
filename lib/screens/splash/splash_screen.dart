import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_jasun/core/constants.dart';
// Dua import ini WAJIB ada dan DIPAKAI di bawah:
import 'package:project_jasun/screens/auth/login_screen.dart';
import 'package:project_jasun/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    // 1. Delay 2 detik
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    // 2. Cek apakah ada user yang sedang login
    final session = Supabase.instance.client.auth.currentSession;