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