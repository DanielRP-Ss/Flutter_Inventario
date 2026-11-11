import 'package:flutter/material.dart';
import '../models/item.dart';

class FormularioScreen extends StatefulWidget {
  final void Function(Item) onGuardar;
  const FormularioScreen({super.key, required this.onGuardar});

  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombre = TextEditingController();
  final _cantidad = TextEditingController();
  final _categoria = TextEditingController();
  int _nextId = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar producto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              controller: _nombre,
              decoration: const InputDecoration(labelText: 'Nombre', border: OutlineInputBorder()),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Campo obligatorio' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _cantidad,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Cantidad', border: OutlineInputBorder()),
              validator: (v) => (v == null || int.tryParse(v) == null || int.parse(v) <= 0) ? 'Ingrese un número válido mayor a 0' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _categoria,
              decoration: const InputDecoration(labelText: 'Categoría', border: OutlineInputBorder()),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Campo obligatorio' : null,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onGuardar(Item(
                    id: _nextId++,
                    nombre: _nombre.text.trim(),
                    cantidad: int.parse(_cantidad.text),
                    categoria: _categoria.text.trim(),
                  ));
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Producto agregado al inventario')),
                  );
                }
              },
              child: const Text('Guardar'),
            ),
          ]),
        ),
      ),
    );
  }
}