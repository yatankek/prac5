import 'package:prac5/features/orders/data/models/order.dart';

class OrderHistoryRepository {
  final List<List<Order>> _history = [];

  List<List<Order>> getAll() => _history;

  void addOrdersToHistory(List<Order> orders) {
    if (orders.isNotEmpty) {
      _history.add(List<Order>.from(orders));
    }
  }
}
