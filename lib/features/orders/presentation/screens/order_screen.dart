import 'package:flutter/material.dart';
import 'package:prac5/features/orders/logic/order_service.dart';
import 'package:prac5/features/orders/presentation/widgets/order_form.dart';
import 'package:prac5/features/orders/presentation/widgets/order_list.dart';
import 'package:prac5/features/orders/presentation/widgets/order_summary.dart';
import 'package:prac5/features/orders/presentation/widgets/empty_state.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final OrderService _service = OrderService();

  void _addOrder(String name, int quantity, double price) {
    setState(() {
      _service.addOrder(name, quantity, price);
    });
  }

  void _removeOrder(order) {
    setState(() {
      _service.removeOrder(order);
    });
  }

  @override
  Widget build(BuildContext context) {
    final orders = _service.orders;
    final total = _service.getTotalSum();

    return Scaffold(
      appBar: AppBar(title: const Text("Учёт заказов")),
      body: Column(
        children: [
          OrderForm(onAdd: _addOrder),
          orders.isEmpty
              ? const EmptyState()
              : OrderList(orders: orders, onRemove: _removeOrder),
          OrderSummary(total: total),
        ],
      ),
    );
  }
}
