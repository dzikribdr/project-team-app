import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:project_jasun/models/product_model.dart';
import 'package:project_jasun/screens/product/product_detail_screen.dart';

class CatalogScreen extends StatefulWidget {
  final int initialCategoryId;

  const CatalogScreen({
    super.key, 
    this.initialCategoryId = 0 // 0 artinya Tampilkan Semua
  });

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final SupabaseClient _supabase = Supabase.instance.client;
  late int _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _selectedCategoryId = widget.initialCategoryId;
  }

  Future<List<Product>> _fetchProducts() async {
    // MODIFIKASI DI SINI: Tambahkan .eq('is_deleted', false)
    dynamic query = _supabase
        .from('products')
        .select()
        .eq('is_deleted', false); 
    
    // Jika kategori bukan 0 (Semua), maka filter
    if (_selectedCategoryId != 0) {
      query = query.eq('category_id', _selectedCategoryId);
    }

    final response = await query.order('created_at', ascending: false);
    final data = response as List<dynamic>;
    return data.map((json) => Product.fromJson(json)).toList();
  }

  // Format Rupiah
  String _formatCurrency(double price) {
    return NumberFormat.currency(
      locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0
    ).format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      // APP BAR PENTING: Agar ada tombol Back
      appBar: AppBar(
        title: const Text("Katalog Produk"),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white, // Warna ikon back putih
        elevation: 0,
      ),
      body: Column(
        children: [
          // FILTER TOMBOL (Scroll Horizontal)
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              children: [
                _buildFilterChip(0, "Semua"),
                _buildFilterChip(1, "Device"),
                _buildFilterChip(2, "Liquid"),
                _buildFilterChip(3, "Accessories"),
              ],
            ),
          ),