import 'package:flutter/material.dart';
import 'Screens/SignUpPage.dart';
import 'Api/MyGetHttpData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter First App',
      // home: MyGetHttpData(),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Signup'),
          ),
          body: SingleChildScrollView(
            child: SignUpPage(),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.blueAccent,
              primaryColor: Colors.white30,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.white)),
            ),
            child: BottomNavigationBar(
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(
                    icon: new Icon(Icons.playlist_add),
                    title: new Text('Playlist')),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.person),
                  title: new Text("My Profile"),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.mail),
                  title: new Text("Inbox"),
                ),
              ],
            ),
          )),
    );
  }
}
