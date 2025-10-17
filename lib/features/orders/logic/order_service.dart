import 'package:prac5/features/orders/data/models/order.dart';
import 'package:prac5/features/orders/data/repository/order_repository.dart';

class OrderService {
  final OrderRepository _repository = OrderRepository();

  // История оформленных заказов
  final List<List<Order>> _orderHistory = [];

  List<Order> get orders => _repository.getAll();

  List<List<Order>> get orderHistory => List.unmodifiable(_orderHistory);

  void addOrder(String name, int quantity, double price) {
    if (name.isEmpty || quantity <= 0 || price <= 0) return;
    _repository.addOrder(Order(name: name, quantity: quantity, price: price));
  }

  void removeOrder(Order order) => _repository.removeOrder(order);

  double getTotalSum() => _repository.getTotalSum();

  // Оформление заказа: перенос в историю и очистка текущих заказов
  void payOrder() {
    final currentOrders = _repository.getAll();
    if (currentOrders.isNotEmpty) {
      _orderHistory.add(List.from(currentOrders)); // копируем текущие заказы
      _repository.clearOrders(); // очищаем список
    }
  }
}
