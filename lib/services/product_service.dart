import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_jasun/models/product_model.dart';


class ProductService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<Product>> getProducts({int? categoryId}) async {
    try {
      var query = _supabase
          .from('products')
          .select()
          .eq('is_deleted', false);

      if (categoryId != null && categoryId != 0) {
        query = query.eq('category_id', categoryId);
      }

      final response = await query.order(
        'created_at',
        ascending: false,
      );

      final data = response as List<dynamic>;
      return data.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Gagal mengambil produk: $e');
    }
  }
}
