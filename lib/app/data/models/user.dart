class FirestoreUser {
  final String uid;
  String? name;
  final String email;
  final String phoneNumber;
  String? photoUrl;

  FirestoreUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.photoUrl,
  });

  // Factory constructor to create a User object from a map (Firestore data)
  factory FirestoreUser.fromMap(Map<String, dynamic> map) {
    return FirestoreUser(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      photoUrl: map['photoUrl'],
    );
  }

  // Convert a User object to a map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
    };
  }
}
