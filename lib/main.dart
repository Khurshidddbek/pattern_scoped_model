import 'package:flutter/material.dart';
import 'package:pattern_scoped_model/pages/create_page.dart';
import 'package:pattern_scoped_model/pages/home_page.dart';
import 'package:pattern_scoped_model/pages/update_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        CreatePage.id: (context) => CreatePage(),
        UpdatePage.id: (context) => UpdatePage(),
      },
    );
  }
}