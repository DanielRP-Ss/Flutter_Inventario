import 'package:flutter/material.dart';
import '../models/item.dart';
import 'formulario_screen.dart';

class ListaScreen extends StatefulWidget {
  const ListaScreen({super.key});

  @override
  State<ListaScreen> createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  final List<Item> _items = [
    Item(id: 1, nombre: 'Mouse Logitech', cantidad: 5, categoria: 'Periféricos'),
    Item(id: 2, nombre: 'Cable HDMI 2m', cantidad: 12, categoria: 'Cables'),
    Item(id: 3, nombre: 'Teclado mecánico', cantidad: 3, categoria: 'Periféricos'),
  ];

  void _agregarItem(Item nuevo) => setState(() => _items.add(nuevo));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventario')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (_, i) => ListTile(
          leading: const Icon(Icons.inventory_2),
          title: Text(_items[i].nombre),
          subtitle: Text(_items[i].categoria),
          trailing: Text('x${_items[i].cantidad}'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => FormularioScreen(onGuardar: _agregarItem)),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}