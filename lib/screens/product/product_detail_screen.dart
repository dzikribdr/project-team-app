import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:project_jasun/models/product_model.dart';
import 'package:project_jasun/services/cart_service.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

  // Format Rupiah
  String _formatCurrency(double price) {
    return NumberFormat.currency(
      locale: 'id_ID', 
      symbol: 'Rp ', 
      decimalDigits: 0
    ).format(price);
  }

  void _incrementQty() {
    if (_quantity < widget.product.stock) {
      setState(() => _quantity++);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Stok maksimum tercapai")),
      );
    }
  }

   void _decrementQty() {
    if (_quantity > 1) {
      setState(() => _quantity--);
    }
  }

  void _addToCart() {
    // Panggil Service
    CartService().addToCart(widget.product, _quantity);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Berhasil menambahkan $_quantity ${widget.product.name} ke keranjang"),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final isOutOfStock = product.stock <= 0;

    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      // AppBar Transparan agar gambar terlihat full di atas (Opsional style)
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CircleAvatar(
          backgroundColor: Colors.black54,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      extendBodyBehindAppBar: true, // Agar gambar bisa sampai paling atas
      body: Column(
        children: [
          // 1. Gambar Produk (Scrollable area)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar Besar
                  SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => 
                        const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey)),
                    ),
                  ),