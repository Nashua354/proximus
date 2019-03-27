import 'package:flutter/material.dart';
import 'package:proximus/widgets/drawer.dart';

//https://github.com/pinkfish/flutter_calendar ANNUAL CALENDER
class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dashboard'),
        leading: Icon(Icons.dashboard),
        automaticallyImplyLeading: false,
      ),
      endDrawer: drawer(context, 'dashboard'),
      body: Center(
        child: Text('DashBoard'),
      ),
    );
  }
}
