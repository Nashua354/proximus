import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Login With Gmail'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
