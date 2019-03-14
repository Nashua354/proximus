import 'package:proximus/services/firebase/cloud_firestore.dart';
import 'package:proximus/services/firebase/firebase_login.dart';

class FirebaseFunctions with FirebaseLogin, CloudFireStore {}

FirebaseFunctions firebase = FirebaseFunctions();
