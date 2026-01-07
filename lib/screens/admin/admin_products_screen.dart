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

    Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      final name = image.name;
      final ext = name.split('.').last;
      setState(() {
        _imageBytes = bytes;
        _imageExtension = ext;
      });
    }
  }

    Future<String?> _uploadImage(Uint8List bytes, String extension) async {
    try {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.$extension';
      final path = 'uploads/$fileName';
      await _supabase.storage
          .from('products')
          .uploadBinary(
            path,
            bytes,
            fileOptions: FileOptions(contentType: 'image/$extension'),
          );
      return _supabase.storage.from('products').getPublicUrl(path);
    } catch (e) {
      debugPrint("Upload Error: $e");
      return null;
    }
  }

    // --- FUNGSI DELETE (SOFT DELETE) ---
  Future<void> _deleteProduct(int productId) async {
    try {
      // KITA TIDAK MENGHAPUS BARIS, TAPI CUMA UPDATE STATUS JADI 'DIHAPUS'
      await _supabase
          .from('products')
          .update({'is_deleted': true})
          .eq('id', productId);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Produk berhasil dihapus (disembunyikan)"),
        ),
      );

      // Tidak perlu setState manual jika kamu pakai StreamBuilder yang sudah difilter
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Gagal menghapus: $e")));
    }
  }
   
    void _showFormDialog({Product? product}) {
    _imageBytes = null;
    _imageExtension = null;
    _isUploading = false;

    // Set Kategori Awal
    _selectedCategoryId = product?.categoryId ?? 1;

    final nameCtrl = TextEditingController(text: product?.name);
    final priceCtrl = TextEditingController(text: product?.price.toString());
    final stockCtrl = TextEditingController(text: product?.stock.toString());
    final descCtrl = TextEditingController(text: product?.description);
    String currentImageUrl = product?.imageUrl ?? '';

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            backgroundColor: AppConstants.cardBgColor,
            title: Text(
              product == null ? "Tambah Produk" : "Edit Produk",
              style: const TextStyle(color: Colors.white),
            ),