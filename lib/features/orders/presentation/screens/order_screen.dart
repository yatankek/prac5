import 'package:flutter/material.dart';
import 'package:prac5/features/orders/logic/order_service.dart';
import 'package:prac5/features/orders/presentation/widgets/order_form.dart';
import 'package:prac5/features/orders/presentation/widgets/order_list.dart';
import 'package:prac5/features/orders/presentation/widgets/order_summary.dart';
import 'package:prac5/features/orders/presentation/widgets/empty_state.dart';

class OrderScreen extends StatefulWidget {
  final OrderService service;
  const OrderScreen({super.key, required this.service});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  void _addOrder(String name, int quantity, double price) {
    setState(() {
      widget.service.addOrder(name, quantity, price);
    });
  }

  void _removeOrder(order) {
    setState(() {
      widget.service.removeOrder(order);
    });
  }

  void _payOrder() {
    setState(() {
      widget.service.payOrder(); // перенос в историю и очистка списка
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Заказ оформлен!")));
  }

  @override
  Widget build(BuildContext context) {
    final orders = widget.service.orders;
    final total = widget.service.getTotalSum();

    return Column(
      children: [
        OrderForm(onAdd: _addOrder),
        orders.isEmpty
            ? const EmptyState()
            : OrderList(orders: orders, onRemove: _removeOrder),
        OrderSummary(total: total, onPay: _payOrder), // кнопка "история" убрана
      ],
    );
  }
}
