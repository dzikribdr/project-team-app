import 'package:flutter/material.dart';
import 'package:project_jasun/services/cart_service.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:project_jasun/screens/main_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPayment = 'Transfer Bank';
  final List<String> _methods = ['Transfer Bank', 'E-Wallet', 'COD (Bayar di Tempat)'];
  bool _isLoading = false;