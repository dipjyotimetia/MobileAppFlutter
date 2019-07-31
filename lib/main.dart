import 'package:flutter/material.dart';
import 'Screens/SignUpPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter First App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Signup'),
        ),
        body: SingleChildScrollView(
          child: SignUpPage(),
        ),
      ),
    );
  }
}
