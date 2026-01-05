import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_jasun/models/order_model.dart';

class OrderService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<Order>> getMyOrders() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return [];

    final response = await _supabase
        .from('orders')
        .select()
        .eq('user_id', user.id);

    final data = response as List<dynamic>;
    return data.map((json) => Order.fromJson(json)).toList();
  }
}

