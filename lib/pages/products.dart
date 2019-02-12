import 'package:flutter/material.dart';
import '../products_manager.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold creates a new 'page' in you app
      appBar: AppBar(
        title: Text('products'),
      ),
      body: ProductsManager() // 传递初始数据给statefulwidget
    );
  }
}