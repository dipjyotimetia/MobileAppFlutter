import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Signup.png"),
            fit: BoxFit.cover,
          )),
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
          decoration: const InputDecoration(labelText: 'Email'),
          validator: _validateEmail,
          keyboardType: TextInputType.emailAddress,
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

  String _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email field cannot be empty!';
    }
    // Regex for email validation
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      return null;
    }
    return 'Email provided isn\'t valid.Try another email address';
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

  Widget _bottomNavigator() {
    return new Scaffold(
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.blueAccent,
              primaryColor: Colors.white30,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.white))),
          child: BottomNavigationBar(
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.playlist_add),
                title: new Text("Playlist"),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.person),
                title: new Text("My Profile"),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.mail),
                title: new Text("Inbox"),
              ),
            ],
          )),
      backgroundColor: Colors.deepPurpleAccent,
    );
  }
}
