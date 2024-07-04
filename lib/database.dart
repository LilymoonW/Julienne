import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference users =
      FirebaseFirestore.instance.collection('user');

  Future updateUserData(String name, String email) async {
    return await users.doc(uid).set({
      'name': name,
      'email': email,
    });
  }
}
