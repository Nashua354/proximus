import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFireStore {
  Future addUser(String userId, String email, String name) async {
    await Firestore.instance.collection('users').document(userId).setData({
      'userId': userId,
      'email': email,
      'name': name,
    });
  }
}
