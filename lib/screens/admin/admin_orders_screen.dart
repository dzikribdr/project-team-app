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
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      body: FutureBuilder(
        future: _supabase.from('orders').select('*, users(full_name)').order('created_at', ascending: false),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (!snapshot.hasData) return const Center(child: Text("Belum ada order", style: TextStyle(color: Colors.grey)));
          
          final orders = snapshot.data as List;