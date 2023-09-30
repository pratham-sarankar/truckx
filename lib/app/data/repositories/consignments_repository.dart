import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transport/app/data/models/consignment.dart';

class ConsignmentRepository {
  Stream<QuerySnapshot<Consignment>> streamConsignments() {
    return FirebaseFirestore.instance
        .collection("consignments")
        .orderBy('date', descending: true)
        .withConverter<Consignment>(
          fromFirestore: (snapshot, _) {
            final data = snapshot.data()!;
            data['id'] = snapshot.id;
            return Consignment.fromJson(data);
          },
          toFirestore: (consignment, _) => consignment.toJson(),
        )
        .snapshots();
  }

  Future<void> addConsignment(Consignment consignment) async {
    await FirebaseFirestore.instance
        .collection("consignments")
        .add(consignment.toJson());
    return;
  }

  Future<void> deleteConsignment(Consignment consignment) async {
    await FirebaseFirestore.instance
        .collection('consignments')
        .doc(consignment.id)
        .delete();
    return;
  }

  Future<void> updateConsignment(Consignment consignment) async {
    await FirebaseFirestore.instance
        .collection("consignments")
        .doc(consignment.id)
        .update(consignment.toJson());
    return;
  }
}
