import 'package:flutter/material.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:project_jasun/screens/admin/admin_products_screen.dart';
import 'package:project_jasun/screens/admin/admin_orders_screen.dart';
import 'package:project_jasun/screens/admin/admin_users_screen.dart';
import 'package:project_jasun/screens/auth/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  int _selectedIndex = 0;
  
  final List<Widget> _pages = [
    const AdminProductsScreen(),
    const AdminOrdersScreen(),
    const AdminUsersScreen(),
  ];