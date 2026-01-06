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
      body: SingleChildScrollView(
        physics:
            const BouncingScrollPhysics(), // Efek scroll membal (iOS style)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // 1. HERO BANNER (PageView)
            _buildHeroSlider(),

            const SizedBox(height: 24),

            // 2. KATEGORI (Sekarang Bisa Diklik)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Kategori",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildCategorySection(context),

            const SizedBox(height: 24),

            // 3. PRODUK TERBARU (Horizontal Scroll)
            _buildSectionHeader("Produk Terbaru", () {
              // Klik "Lihat Semua" -> ke Catalog
              _navigateToCategory(context, 0);
            }),
            const SizedBox(height: 12),
            _buildNewArrivals(),

            const SizedBox(height: 24),

            // 4. PROMO BANNER (Statik)
            _buildPromoBanner(),

            const SizedBox(height: 24),

            
            // 5. REKOMENDASI (Vertical List)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Rekomendasi Untukmu",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),