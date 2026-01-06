import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:project_jasun/models/product_model.dart';
import 'package:project_jasun/services/product_service.dart';
import 'package:project_jasun/screens/catalog/catalog_screen.dart';
import 'package:project_jasun/screens/product/product_detail_screen.dart';  

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService _productService = ProductService();

  // Ambil nama user
  String get _userName {
    final user = Supabase.instance.client.auth.currentUser;
    return user?.userMetadata?['full_name'] ?? user?.email ?? 'Vapers';
  }

 // Format Rupiah
  String _formatCurrency(double price) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(price);
  }


  // Navigasi ke Kategori Tertentu
  void _navigateToCategory(BuildContext context, int categoryId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CatalogScreen(initialCategoryId: categoryId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      // AppBar custom yang lebih modern
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Selamat Datang,",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              _userName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {}, // Fitur notifikasi (future)
          ),
        ],
      ),