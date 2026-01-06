import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase
import 'package:project_jasun/models/order_model.dart';
import 'package:project_jasun/services/auth_service.dart';
import 'package:project_jasun/services/order_service.dart';
import 'package:project_jasun/screens/auth/login_screen.dart';
import 'package:project_jasun/core/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _authService = AuthService();
  final OrderService _orderService = OrderService();

  // Variabel untuk menampung data user
  String _fullName = 'Loading...';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _loadUserProfile(); // Ambil data saat halaman dibuka
  }

  // Fungsi Ambil Data User dari Supabase Auth
  void _loadUserProfile() {
    final user = Supabase.instance.client.auth.currentUser;
    if (user != null) {
      setState(() {
        // Ambil nama dari metadata (saat register), jika kosong pakai 'Pelanggan'
        _fullName = user.userMetadata?['full_name'] ?? 'Pelanggan';
        _email = user.email ?? '-';
      });
    }
  }