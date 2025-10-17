import 'package:flutter/material.dart';
import 'package:prac5/features/orders/logic/order_service.dart';
import 'package:prac5/features/orders/data/models/order.dart';

class OrderHistoryScreen extends StatelessWidget {
  final OrderService service;
  const OrderHistoryScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final history = service.orderHistory; // <-- использован геттер

    return Scaffold(
      appBar: AppBar(title: const Text("История заказов")),
      body: history.isEmpty
          ? const Center(child: Text("История заказов пуста"))
          : ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final orders = history[index];
          final total = orders.fold(0.0, (sum, o) => sum + o.total);
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text("Заказ №${index + 1}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: orders
                    .map((o) => Text("${o.name} × ${o.quantity} — ${o.total.toStringAsFixed(2)} ₽"))
                    .toList(),
              ),
              trailing: Text("${total.toStringAsFixed(2)} ₽"),
            ),
          );
        },
      ),
    );
  }
}
