import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Container();
  }

  Widget formUi() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Item'),
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Amount'),
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'DateOfPurchase'),
        ),
      ],
    );
  }
}
