import 'package:flutter/material.dart';
import 'package:proximus/models/User.dart';
import 'package:proximus/services/firebase/firebase_functions.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Login With Gmail'),
            onPressed: () async {
              userObject.fbUser = await firebase.handleSignIn();
              print(userObject.fbUser);
            },
          ),
        ),
      ),
    );
  }
}
