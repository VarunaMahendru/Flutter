import 'package:flutter/material.dart';
import 'login.dart';
import 'routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Simple Login Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.orange,
          cursorColor: Colors.orange
      ),
      home: new LoginPage(),
     // routes: routes,
    );
  }
}
