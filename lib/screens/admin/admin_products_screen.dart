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
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- GAMBAR ---
                  GestureDetector(
                    onTap: () async {
                      await _pickImage();
                      setDialogState(() {});
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: _imageBytes != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.memory(
                                _imageBytes!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : (currentImageUrl.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      currentImageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Center(
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  )),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // --- INPUT FIELDS ---
                  _buildField(nameCtrl, "Nama Produk"),

                  // DROPDOWN KATEGORI
                  const Text(
                    "Kategori",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  DropdownButtonFormField<int>(
                    value: _selectedCategoryId,
                    dropdownColor: AppConstants.cardBgColor,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    items: _categories.map((cat) {
                      return DropdownMenuItem<int>(
                        value: cat['id'],
                        child: Text(cat['name']),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null)
                        setDialogState(() => _selectedCategoryId = val);
                    },
                  ),
                  const SizedBox(height: 8),

                  _buildField(priceCtrl, "Harga", isNumber: true),
                  _buildField(stockCtrl, "Stok", isNumber: true),
                  _buildField(descCtrl, "Deskripsi", maxLines: 3),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: _isUploading ? null : () => Navigator.pop(context),
                child: const Text("Batal"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.accentColor,
                ),
                onPressed: _isUploading
                    ? null
                    : () async {
                        setDialogState(() => _isUploading = true);
                        String finalImageUrl = currentImageUrl;

                        if (_imageBytes != null) {
                          final url = await _uploadImage(
                            _imageBytes!,
                            _imageExtension ?? 'jpg',
                          );
                          if (url != null) finalImageUrl = url;
                        }

                        final data = {
                          'name': nameCtrl.text,
                          'price': double.tryParse(priceCtrl.text) ?? 0,
                          'stock': int.tryParse(stockCtrl.text) ?? 0,
                          'image_url': finalImageUrl,
                          'description': descCtrl.text,
                          'category_id': _selectedCategoryId,
                          // Pastikan saat insert baru, is_deleted false
                          if (product == null) 'is_deleted': false,
                        };

                        try {
                          if (product == null) {
                            await _supabase.from('products').insert(data);
                          } else {
                            await _supabase
                                .from('products')
                                .update(data)
                                .eq('id', product.id);
                          }
                          if (mounted) Navigator.pop(context);
                        } catch (e) {
                          debugPrint("DB Error: $e");
                        } finally {
                          setDialogState(() => _isUploading = false);
                        }
                      },
                child: _isUploading
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.black),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildField(
    TextEditingController ctrl,
    String label, {
    bool isNumber = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: ctrl,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
