import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final double total;
  final VoidCallback onPay;

  const OrderSummary({
    super.key,
    required this.total,
    required this.onPay,
  });

  String _formatPrice(double price) => "${price.toStringAsFixed(2)} ₽";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade50,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Итого:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                _formatPrice(total),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onPay,
            child: const Text("Оформить заказ"),
          ),
        ],
      ),
    );
  }
}
