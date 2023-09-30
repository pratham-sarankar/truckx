class Vehicle {
  final String id;
  String? photoUrl;
  String number;
  VehicleType type;
  int mfgYear;
  final String? ownerId;

  Vehicle({
    required this.id,
    this.photoUrl,
    required this.number,
    required this.type,
    required this.mfgYear,
    required this.ownerId,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      photoUrl: json['photoUrl'],
      ownerId: json['ownerId'],
      number: json['number'],
      type: VehicleTypeExtension.fromString(json['type']),
      mfgYear: json['mfgYear'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'photoUrl': photoUrl,
      'number': number,
      'type': type.name,
      'mfgYear': mfgYear,
      'ownerId': ownerId,
    };
  }
}

enum VehicleType {
  xl,
  xxl,
}

extension VehicleTypeExtension on VehicleType {
  String get name {
    switch (this) {
      case VehicleType.xl:
        return "XL";
      case VehicleType.xxl:
        return "XXL";
    }
  }

  //From String
  static VehicleType fromString(String value) {
    switch (value) {
      case "XL":
        return VehicleType.xl;
      case "XXL":
        return VehicleType.xxl;
      default:
        return VehicleType.xl;
    }
  }

  String get description {
    switch (this) {
      case VehicleType.xl:
        return "Extra Large";
      case VehicleType.xxl:
        return "Extra Extra Large";
    }
  }
}
