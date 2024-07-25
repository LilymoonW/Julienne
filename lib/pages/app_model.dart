import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class userModel with ChangeNotifier {
  User? _user;
  String? _uid;
  String? userName;
  String? email;

  final CollectionReference users =
      FirebaseFirestore.instance.collection('user');

  userModel() {
    // Call the function in the constructor
    initialize();
    fetchData();
  }

  void initialize() async {
    User? user = FirebaseAuth.instance.currentUser;
    _user = user!;
    _uid = user.uid;
  }

  Future<void> fetchData() async {
    DocumentSnapshot<Map<String, dynamic>> docSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) {
        // Access individual fields
        userName = data['name'];
        email = data['email'];
      }
    }
  }
}
