import 'package:supabase_flutter/supabase_flutter.dart';

class ProductService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<dynamic>> getProducts() async {
  final response = await _supabase
      .from('products')
      .select();

  return response;
}

}

