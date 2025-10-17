import 'package:flutter/material.dart';

class OrderForm extends StatefulWidget {
  final void Function(String name, int quantity, double price) onAdd;
  const OrderForm({super.key, required this.onAdd});

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();

  void _submit() {
    final name = _nameController.text.trim();
    final quantity = int.tryParse(_quantityController.text) ?? 0;
    final price = double.tryParse(_priceController.text) ?? 0.0;

    widget.onAdd(name, quantity, price);

    _nameController.clear();
    _quantityController.clear();
    _priceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: "Название блюда",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Количество",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Цена (₽)",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _submit,
            child: const Text("Добавить"),
          ),
        ],
      ),
    );
  }
}
