class Order {
  final int id;
  final double total;
  final String status;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.total,
    required this.status,
    required this.createdAt,
  });
}