import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:project_jasun/models/product_model.dart';

class AdminProductsScreen extends StatefulWidget {
  const AdminProductsScreen({super.key});

  @override
  State<AdminProductsScreen> createState() => _AdminProductsScreenState();
}

class _AdminProductsScreenState extends State<AdminProductsScreen> {
  final _supabase = Supabase.instance.client;

  Uint8List? _imageBytes;
  String? _imageExtension;
  bool _isUploading = false;

// VARIABLE UNTUK KATEGORI
  int _selectedCategoryId = 1;

  // List Kategori Manual
  final List<Map<String, dynamic>> _categories = [
    {'id': 1, 'name': 'Device'},
    {'id': 2, 'name': 'Liquid'},
    {'id': 3, 'name': 'Accessories'},
  ];

  // --- FILTER PRODUK YANG DIHAPUS ---
  Stream<List<Product>> _getProductsStream() {
    return _supabase
        .from('products')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map(
          (data) => data
              .where((json) => json['is_deleted'] != true) // <--- INI PENTING
              .map((json) => Product.fromJson(json))
              .toList(),
        );
  }