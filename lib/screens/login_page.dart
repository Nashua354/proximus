import 'package:flutter/material.dart';
import 'package:proximus/services/firebase/firebase_functions.dart';
import 'package:proximus/services/shared_preferences.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Login With Gmail'),
            onPressed: () async {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.transparent,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  });
              dynamic user = await firebase.handleSignIn();
              if (user.isEmailVerified) {
                await local.setUserId(user.uid);
                await firebase.addUser(user.uid, user.email, user.displayName);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/dashboard', (Route<dynamic> route) => false);
              } else {
                SnackBar(
                  content: Text('Login Failed'),
                  duration: Duration(seconds: 1),
                );
                Navigator.pop(context);
              }
            },
          ),
        ),
      ),
    );
  }
}
