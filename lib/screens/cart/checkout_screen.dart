import 'package:flutter/material.dart';
import 'package:project_jasun/services/cart_service.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:project_jasun/screens/main_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPayment = 'Transfer Bank';
  final List<String> _methods = ['Transfer Bank', 'E-Wallet', 'COD (Bayar di Tempat)'];
  bool _isLoading = false;

   Future<void> _processOrder() async {
    setState(() => _isLoading = true);

    try {
      // Panggil fungsi checkout di CartService
      await CartService().checkout(); 
      
      if (!mounted) return;

      // Tampilkan Dialog Sukses
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          backgroundColor: AppConstants.cardBgColor,
          title: const Text("Pesanan Berhasil!", style: TextStyle(color: Colors.white)),
          content: const Text("Terima kasih sudah berbelanja. Cek status pesanan di Profil.", style: TextStyle(color: Colors.grey)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const MainScreen()),
                  (route) => false,
                );
              },
              child: const Text("OK", style: TextStyle(color: AppConstants.accentColor)),
            )
          ],
        ),
      );
    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal: $e"), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }