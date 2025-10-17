import 'package:flutter/material.dart';
import 'package:prac5/features/orders/data/models/order.dart';

class OrderList extends StatelessWidget {
  final List<Order> orders;
  final void Function(Order) onRemove;

  const OrderList({
    super.key,
    required this.orders,
    required this.onRemove,
  });

  String _formatPrice(double price) => "${price.toStringAsFixed(2)} ₽";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text("${order.name} × ${order.quantity}"),
              subtitle: Text("Цена за штуку: ${_formatPrice(order.price)}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => onRemove(order),
              ),
            ),
          );
        },
      ),
    );
  }
}
