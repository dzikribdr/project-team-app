import 'package:supabase_flutter/supabase_flutter.dart';

class OrderService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<dynamic>> getMyOrders() async {
    final response = await _supabase
        .from('orders')
        .select();

    return response;
  }
}
