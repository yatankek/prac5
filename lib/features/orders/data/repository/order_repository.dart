import 'package:prac5/features/orders/data/models/order.dart';

class OrderRepository {
  final List<Order> _orders = [];

  List<Order> getAll() => List.unmodifiable(_orders);

  void addOrder(Order order) => _orders.add(order);

  void removeOrder(Order order) => _orders.remove(order);

  double getTotalSum() => _orders.fold(0, (sum, o) => sum + o.total);

  void clearOrders() => _orders.clear();
}
