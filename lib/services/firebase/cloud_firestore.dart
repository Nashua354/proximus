import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proximus/models/User.dart';
import 'package:proximus/utils/dropdown.dart';

class CloudFireStore {
  Future addUser(String userId, String email, String name) async {
    await Firestore.instance.collection('users').document(userId).setData({
      'userId': userId,
      'email': email,
      'name': name,
    });
  }

  Future registerUser(String name, String number, String collegeName,
      String branch, int year) async {
    await Firestore.instance
        .collection('users')
        .document(userObject.userId)
        .setData({
      'name': name,
      "phone": number,
      'college': collegeName,
      'branch': branch,
      'year': year
    }, merge: true);
  }

  Future setfcmToken(String fcmToken) async {
    print('Set FCM TOKen to FireBase');
    await Firestore.instance
        .collection('users')
        .document(userObject.userId)
        .setData({'fcmToken': fcmToken}, merge: true);
    await Firestore.instance
        .collection('fcmtokens')
        .document(userObject.userId)
        .setData({'fcmToken': fcmToken}, merge: true);
  }

  Future addNotification(
      String title, String body, String selectedChoice, String member) async {
    await Firestore.instance.collection('notifications').document().setData({
      'title': title,
      'body': body,
      'choice': (selectedChoice == 'all') ? selectedChoice : member
    }, merge: true);
  }

  Future populateUserforNotification() async {
    await Firestore.instance
        .collection('users')
        .getDocuments()
        .then((snapshots) {
      userIds.clear();
      for (var item in snapshots.documents) {
        userIds.add(DropdownMenuItem(
            child: Text(item.data['email']), value: item.data['fcmToken']));
      }
    });
  }
}
