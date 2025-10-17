class Order {
  final String name;
  final int quantity;
  final double price;

  double get total => quantity * price;

  Order({
    required this.name,
    required this.quantity,
    required this.price,
  });
}
