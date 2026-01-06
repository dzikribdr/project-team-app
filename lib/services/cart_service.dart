import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_jasun/models/cart_item_model.dart';
import 'package:project_jasun/models/product_model.dart';

class CartService {
  // Singleton Pattern
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

   // List penyimpan data sementara
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Tambah ke Cart (Standard)
  void addToCart(Product product, int quantity) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    
    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(product: product, quantity: quantity));
    }
  }

   void updateQuantity(Product product, int delta) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index].quantity += delta;
      
      // Hapus jika quantity 0 atau negatif
      if (_items[index].quantity <= 0) {
        removeItem(product.id);
      }
    }
  }

  // Hapus item berdasarkan ID Product
  void removeItem(int id) {
    _items.removeWhere((item) => item.product.id == id);
  }

  // Hitung Total Belanja
  double getTotalPrice() {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }

   // Kosongkan Cart
  void clearCart() {
    _items.clear();
  }