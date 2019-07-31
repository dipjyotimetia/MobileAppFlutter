import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(15.0),
      child: new Form(
        key: _formKey,
        child: formUI(),
      ),
    );
  }

  Widget formUI() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Username'),
          validator: _validateUsername,
        ),
        new TextFormField(
          keyboardType: TextInputType.text,
          validator: _validatePassword,
          obscureText: isPasswordVisible, //This will obscure text dynamically
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible
                      ? isPasswordVisible = false
                      : isPasswordVisible = true;
                });
              },
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing data')));
                }
              },
              child: Text('Submit'),
            ))
      ],
    );
  }

  String _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password field cannot be empty';
    }
    if (value.length < 6) {
      return 'Password length must be greater than 6';
    }
    return '';
  }

  String _validateUsername(String value) {
    if (value.isEmpty) {
      return 'Username  cannot be empty';
    }
    if (value.length < 6) {
      return 'Username length must be greater than 6';
    }
    return '';
  }
}
