import 'package:flutter/material.dart';
import 'package:proximus/services/shared_preferences.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text('Logout'),
              onPressed: () async {
                await local.clear();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('DashBoard'),
      ),
    );
  }
}
