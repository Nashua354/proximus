import 'package:flutter/material.dart';
import 'package:proximus/services/firebase/firebase_functions.dart';
import 'package:proximus/widgets/drawer.dart';
import 'package:proximus/utils/dropdown.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  void initState() {
    super.initState();
    firebase.populateUserforNotification();
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String title = '';
  String body = '';
  String selectedChoice;
  String member;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Admin Panel'),
      ),
      endDrawer: drawer(context, 'admin'),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
              title: TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                onSaved: (value) {
                  title = value;
                },
              ),
            ),
            ListTile(
              title: TextFormField(
                maxLines: 8,
                decoration: InputDecoration(
                    hintText: 'Notification Body',
                    border: OutlineInputBorder()),
                onSaved: (value) {
                  body = value;
                },
              ),
            ),
            ListTile(
              title: DropdownButtonFormField(
                hint: Text('Send to'),
                value: selectedChoice,
                items: choice,
                onSaved: (value) {
                  selectedChoice = value;
                },
                onChanged: (value) {
                  selectedChoice = value;

                  setState(() {});
                },
              ),
            ),
            (selectedChoice == 'one')
                ? ListTile(
                    title: DropdownButtonFormField(
                      hint: Text('Member'),
                      value: member,
                      items: userIds,
                      onSaved: (value) {
                        member = value;
                      },
                      onChanged: (value) {
                        member = value;

                        setState(() {});
                      },
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () async {
                  _formKey.currentState.save();
                  print(body);
                  print(title);
                  print(selectedChoice);
                  print(member);
                  await firebase.addNotification(
                      title, body, selectedChoice, member);
                  print('Notification sent');
                  Navigator.of(context).pop();
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
