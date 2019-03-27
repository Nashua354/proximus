import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proximus/models/User.dart';
import 'package:proximus/services/shared_preferences.dart';

Widget drawer(BuildContext context, String page) {
  return Drawer(
    child: Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              margin: EdgeInsets.all(0),
              currentAccountPicture: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(Icons.person)),
              accountName: Text(userObject.name),
              accountEmail: Text(userObject.email),
            ),
            GestureDetector(
              child: Container(
                color:
                    page == 'dashboard' ? Colors.blueGrey : Colors.transparent,
                child: ListTile(
                  title: Text('Dashboard'),
                  trailing: Icon(Icons.dashboard),
                ),
              ),
              onTap: page == 'dashboard'
                  ? () => Navigator.of(context).pop()
                  : () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/dashboard', (Route<dynamic> route) => false);
                    },
            ),
            GestureDetector(
              child: Container(
                color: page == 'admin' ? Colors.blueGrey : Colors.transparent,
                child: ListTile(
                  title: Text('Admin - Panel'),
                  trailing: Icon(Icons.build),
                ),
              ),
              onTap: page == 'admin'
                  ? () => Navigator.of(context).pop()
                  : () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/admin');
                    },
            ),
            GestureDetector(
              child: Container(
                color: page == 'profile' ? Colors.blueGrey : Colors.transparent,
                child: ListTile(
                  trailing: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ),
              onTap: page == 'profile'
                  ? () => Navigator.of(context).pop()
                  : () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/profile');
                    },
            ),
            GestureDetector(
              child: Container(
                color: page == 'registration'
                    ? Colors.blueGrey
                    : Colors.transparent,
                child: ListTile(
                  title: Text('Registration'),
                  trailing: Icon(Icons.person_add),
                ),
              ),
              onTap: page == 'registration'
                  ? () => Navigator.of(context).pop()
                  : () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/registration');
                    },
            ),
            ListTile(
              title: Text('Resources'),
              trailing: Icon(Icons.book),
            ),
            ListTile(
              title: Text('Contests'),
              trailing: Icon(Icons.code),
            ),
            ListTile(
              title: Text('Rewards'),
              trailing: Icon(Icons.card_giftcard),
            ),
            ListTile(
              title: Text('Annual Calender'),
              trailing: Icon(Icons.calendar_today),
            ),
            ListTile(
              title: Text('Hall of Fame'),
              trailing: Icon(Icons.format_list_numbered),
            ),
            ListTile(
              title: Text('Notices'),
              trailing: Icon(Icons.priority_high),
            ),
            ListTile(
              title: Text('FAQ'),
              trailing: Icon(Icons.question_answer),
            ),
            ListTile(
              title: Text('Projects'),
              trailing: Icon(Icons.work),
            ),
            ListTile(title: Text('')),
          ],
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: GestureDetector(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.redAccent,
                child: ListTile(
                  title: Text('Logout'),
                  trailing: Icon(Icons.sentiment_very_dissatisfied),
                ),
              ),
            ),
            onTap: () async {
              await local.clear();
              Navigator.pop(context);
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
            },
          ),
        ),
      ],
    ),
  );
}
