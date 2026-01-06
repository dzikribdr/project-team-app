import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:project_jasun/services/cart_service.dart';
import 'package:project_jasun/screens/cart/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartService _cartService = CartService();

 // Format Rupiah
  String _formatCurrency(double price) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(price);
  }

   void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final items = _cartService.items;
    final subtotal = _cartService.getTotalPrice();
    final ongkir = items.isEmpty ? 0.0 : 15000.0; // Dummy Ongkir
    final total = subtotal + ongkir;

    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      appBar: AppBar(
        title: const Text("Keranjang Belanja"),
        backgroundColor: AppConstants.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: items.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Keranjang kamu kosong",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
            : Column(
              children: [
                // LIST ITEM
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppConstants.cardBgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            // Gambar Kecil
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                item.product.imageUrl,
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.image, color: Colors.grey),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Info & Kontrol
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.product.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _formatCurrency(item.product.price),
                                    style: const TextStyle(
                                      color: AppConstants.accentColor,
                                      fontSize: 12,
                                    ),
                                  ),