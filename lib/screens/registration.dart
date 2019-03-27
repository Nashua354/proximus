import 'package:flutter/material.dart';
import 'package:proximus/models/User.dart';
import 'package:proximus/services/firebase/firebase_functions.dart';
import 'package:proximus/widgets/drawer.dart';
import 'package:proximus/utils/dropdown.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String name;
  String phone;
  String collegeName;
  String branch;
  int year;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registration'),
      ),
      endDrawer: drawer(context, 'registration'),
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: TextFormField(
                initialValue: userObject.name,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                onSaved: (value) {
                  name = value;
                },
              ),
            ),
            ListTile(
              title: TextFormField(
                enabled: false,
                initialValue: userObject.email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) {
                  email = value;
                },
              ),
            ),
            ListTile(
              title: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone'),
                onSaved: (value) {
                  phone = value;
                },
              ),
            ),
            ListTile(
              title: DropdownButtonFormField(
                hint: Text('College'),
                value: collegeName,
                items: collegeNameItems,
                onSaved: (value) {
                  collegeName = value;
                },
                onChanged: (value) {
                  collegeName = value;

                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: DropdownButtonFormField(
                hint: Text('Branch'),
                value: branch,
                items: branchItems,
                onSaved: (value) {
                  branch = value;
                },
                onChanged: (value) {
                  branch = value;

                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: DropdownButtonFormField(
                hint: Text('Year'),
                value: year,
                items: items,
                onSaved: (value) {
                  year = value;
                },
                onChanged: (value) {
                  year = value;

                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () async {
                  _formkey.currentState.save();
                  await firebase.registerUser(
                      name, phone, collegeName, branch, year);
                  print('Success');
                },
                child: Container(
                  color: Colors.blueGrey,
                  child: ListTile(
                    title: Center(child: Text('Submit')),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
