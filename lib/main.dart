import 'package:flutter/material.dart';
import 'screens/product_search_screen.dart';

void main() {
  runApp(CorelabApp());
}

class CorelabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corelab App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductSearchScreen(),
      debugShowCheckedModeBanner: false, // Remove o banner de debug
    );
  }
}
