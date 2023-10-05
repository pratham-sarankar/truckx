class Place {
  final String name;
  final String address;

  // Add other fields you need

  Place({
    required this.name,
    required this.address,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      address: json['formatted_address'],
      // Add other fields as needed
    );
  }
}
