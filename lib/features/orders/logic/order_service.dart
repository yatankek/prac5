import 'package:prac5/features/orders/data/models/order.dart';
import 'package:prac5/features/orders/data/repository/order_repository.dart';
import 'package:prac5/features/orders/data/repository/order_history_repository.dart';

class OrderService {
  final OrderRepository _orderRepository = OrderRepository();
  final OrderHistoryRepository _orderHistoryRepository = OrderHistoryRepository();

  List<Order> get orders => _orderRepository.getAll();

  List<List<Order>> get orderHistory => _orderHistoryRepository.getAll();

  void addOrder(String name, int quantity, double price) {
    if (name.isEmpty || quantity <= 0 || price <= 0) return;
    _orderRepository.addOrder(Order(name: name, quantity: quantity, price: price));
  }

  void removeOrder(Order order) => _orderRepository.removeOrder(order);

  double getTotalSum() => _orderRepository.getTotalSum();

  // Оформление заказа: перенос в историю и очистка текущих заказов
  void payOrder() {
    final currentOrders = _orderRepository.getAll();
    if (currentOrders.isNotEmpty) {
      _orderHistoryRepository.addOrdersToHistory(currentOrders);
      _orderRepository.clearOrders();
    }
  }
}