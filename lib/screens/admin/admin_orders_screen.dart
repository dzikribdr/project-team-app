import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:intl/intl.dart';

class AdminOrdersScreen extends StatefulWidget {
  const AdminOrdersScreen({super.key});

  @override 
  State<AdminOrdersScreen> createState() => _AdminOrdersScreenState();
}

class _AdminOrdersScreenState extends State<AdminOrdersScreen> {
  final _supabase = Supabase.instance.client;

  Future<void> _updateStatus(int orderId, String newStatus) async {
    await _supabase.from('orders').update({'status': newStatus}).eq('id', orderId);
    setState(() {}); 
  }

  Color _getStatusColor(String status) {
    switch(status) {
      case 'completed': return Colors.green;
      case 'shipped': return Colors.blue;
      case 'cancelled': return Colors.red;
      default: return Colors.orange;
    }
  }