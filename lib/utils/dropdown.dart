import 'package:flutter/material.dart';

List<DropdownMenuItem> items = [
  DropdownMenuItem(child: Text('First Year'), value: 1),
  DropdownMenuItem(child: Text('Second Year'), value: 2),
  DropdownMenuItem(child: Text('Third Year'), value: 3),
  DropdownMenuItem(child: Text('Fourth Year'), value: 4)
];
List<DropdownMenuItem> branchItems = [
  DropdownMenuItem(child: Text('CSE'), value: 'CSE'),
  DropdownMenuItem(child: Text('IT'), value: 'IT'),
  DropdownMenuItem(child: Text('ECE'), value: 'ECE'),
  DropdownMenuItem(child: Text('EEE'), value: 'EEE'),
  DropdownMenuItem(child: Text('Mech'), value: 'Mech')
];
List<DropdownMenuItem> collegeNameItems = [
  DropdownMenuItem(child: Text('HMRITM'), value: 'HMRITM'),
  // DropdownMenuItem(child: Text('MAIT'), value: 'MAIT'),
  // DropdownMenuItem(child: Text('MSIT'), value: 'MSIT'),
  // DropdownMenuItem(child: Text('NIEC'), value: 'NIEC'),
  // DropdownMenuItem(child: Text('GTBIT'), value: 'GTBIT'),
  // DropdownMenuItem(child: Text('BPIT'), value: 'BPIT')
];
List<DropdownMenuItem> choice = [
  DropdownMenuItem(child: Text('Send to All'), value: 'all'),
  DropdownMenuItem(child: Text('Send to one'), value: 'one')
];
List<DropdownMenuItem> userIds = [];
