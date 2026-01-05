import 'package:supabase_flutter/supabase_flutter.dart';

class OrderService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<dynamic>> getMyOrders() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return [];

    final response = await _supabase
        .from('orders')
        .select()
        .eq('user_id', user.id);

    return response;
  }
}
