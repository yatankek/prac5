import 'package:flutter/material.dart';
import 'package:prac5/features/orders/logic/order_service.dart';
import 'package:prac5/features/orders/presentation/screens/order_screen.dart';
import 'package:prac5/features/orders/presentation/screens/order_history_screen.dart';

class OrderHomeScreen extends StatefulWidget {
  const OrderHomeScreen({super.key});

  @override
  State<OrderHomeScreen> createState() => _OrderHomeScreenState();
}

class _OrderHomeScreenState extends State<OrderHomeScreen> {
  final OrderService _service = OrderService();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      OrderScreen(service: _service),
      OrderHistoryScreen(service: _service),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Заказы"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "История"),
        ],
      ),
    );
  }
}
