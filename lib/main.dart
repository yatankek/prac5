import 'package:flutter/material.dart';
import 'package:prac5/features/orders/presentation/screens/order_screen.dart';

void main() {
  runApp(const OrderApp());
}

class OrderApp extends StatelessWidget {
  const OrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Учёт заказов ресторана',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const OrderScreen(),
    );
  }
}
