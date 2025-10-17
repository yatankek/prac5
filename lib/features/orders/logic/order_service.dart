import 'package:prac5/features/orders/data/models/order.dart';
import 'package:prac5/features/orders/data/repository/order_repository.dart';

class OrderService {
  final OrderRepository _repository = OrderRepository();

  List<Order> get orders => _repository.getAll();

  void addOrder(String name, int quantity, double price) {
    if (name.isEmpty || quantity <= 0 || price <= 0) return;
    _repository.addOrder(Order(name: name, quantity: quantity, price: price));
  }

  void removeOrder(Order order) => _repository.removeOrder(order);

  double getTotalSum() => _repository.getTotalSum();
}
