class Consignment {
  String id;
  String uid;
  String from;
  String to;
  String product;
  double weight;
  double price;
  DateTime date;
  double advance;
  String logisticsName;

  Consignment({
    required this.id,
    required this.uid,
    required this.from,
    required this.to,
    required this.product,
    this.weight = 1,
    required this.price,
    required this.date,
    required this.advance,
    required this.logisticsName,
  });

  factory Consignment.fromJson(Map<String, dynamic> json) {
    return Consignment(
      id: json['id'],
      uid: json['uid'],
      from: json['from'],
      to: json['to'],
      product: json['product'],
      weight: json['weight'],
      price: json['price'],
      date: json['date'].toDate(),
      advance: json['advance'],
      logisticsName: json['logisticsName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'from': from,
      'to': to,
      'product': product,
      'weight': weight,
      'price': price,
      'date': date,
      'advance': advance,
      'logisticsName': logisticsName,
    };
  }
}
