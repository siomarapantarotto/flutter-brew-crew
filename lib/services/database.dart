import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/brew.dart';

class DatabaseService {
  
  final String uid;
  DatabaseService({required this.uid});

// Collection reference.
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String name, String sugars, int strength) async {
    return await brewCollection.doc(uid).set({
      'name': name,
      'sugars': sugars,
      'strength': strength,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.get('name') ?? '',
        sugars: doc.get('sugars') ?? '0',
        strength: doc.get('strength') ?? 0
      );
     }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

}
