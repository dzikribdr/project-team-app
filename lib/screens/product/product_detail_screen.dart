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