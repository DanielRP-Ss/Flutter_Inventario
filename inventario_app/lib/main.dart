import 'package:flutter/material.dart';
import 'screens/lista_screen.dart';

void main() => runApp(const InventarioApp());

class InventarioApp extends StatelessWidget {
  const InventarioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const ListaScreen(),
    );
  }
}