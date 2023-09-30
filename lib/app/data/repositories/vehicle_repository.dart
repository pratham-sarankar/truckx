import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:transport/app/data/models/vehicle.dart';

class VehicleRepository {
  Stream<QuerySnapshot<Vehicle>> streamVehicles() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection("vehicles")
        .where("ownerId", isEqualTo: uid)
        .withConverter<Vehicle>(
          fromFirestore: (snapshot, _) {
            final data = snapshot.data()!;
            data['id'] = snapshot.id;
            return Vehicle.fromJson(data);
          },
          toFirestore: (vehicle, _) => vehicle.toJson(),
        )
        .snapshots();
  }

  Future<void> addVehicle(Vehicle vehicle) async {
    await FirebaseFirestore.instance
        .collection("vehicles")
        .add(vehicle.toJson());
    return;
  }

  Future<void> deleteVehicle(Vehicle vehicle) async {
    await FirebaseFirestore.instance
        .collection('vehicles')
        .doc(vehicle.id)
        .delete();
    //Also delete the image from storage
    if (vehicle.photoUrl != null) {
      await FirebaseStorage.instance.refFromURL(vehicle.photoUrl!).delete();
    }
    return;
  }

  Future<void> updateVehicle(Vehicle vehicle) async {
    await FirebaseFirestore.instance
        .collection("vehicles")
        .doc(vehicle.id)
        .update(vehicle.toJson());
    return;
  }
}
