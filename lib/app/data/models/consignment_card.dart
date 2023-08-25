class Consignment {
  final String from;
  final String to;
  final String product;
  final double weight;
  final double price;
  final DateTime date;
  final double advance;
  final String logisticsName;

  Consignment({
    required this.from,
    required this.to,
    required this.product,
    this.weight = 1,
    required this.price,
    required this.date,
    required this.advance,
    required this.logisticsName,
  });
}
