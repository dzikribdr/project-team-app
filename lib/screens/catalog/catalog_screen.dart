import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:project_jasun/models/product_model.dart';
import 'package:project_jasun/screens/product/product_detail_screen.dart';

class CatalogScreen extends StatefulWidget {
  final int initialCategoryId;

  const CatalogScreen({
    super.key, 
    this.initialCategoryId = 0 // 0 artinya Tampilkan Semua
  });