import 'package:flutter/material.dart';

import 'home_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mheecha',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff32373D),
        accentColor: Color(0xff0B91E0),
      ),
      home: Home(),
    );
  }
}
