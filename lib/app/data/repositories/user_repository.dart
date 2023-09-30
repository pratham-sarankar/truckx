import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  Future<void> updateUser(User user) async {
    await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
      "name": user.displayName,
      "email": user.email,
      "photoUrl": user.photoURL,
      "phoneNumber": user.phoneNumber,
      "uid": user.uid,
    });
    return;
  }
}
