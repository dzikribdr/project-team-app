import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_jasun/models/product_model.dart';

class ProductService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<Product>> getProducts() async {
    try {
      final response = await _supabase
          .from('products')
          .select();

      final data = response as List<dynamic>;
      return data.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Gagal mengambil produk: $e');
    }
  }
}
