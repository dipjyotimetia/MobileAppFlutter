import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Create a stateful widget
class MyGetHttpData extends StatefulWidget {
  @override
  MyGetHttpDataState createState() => MyGetHttpDataState();
}

// Create the state for our stateful widget
class MyGetHttpDataState extends State<MyGetHttpData> {
  final String url = "https://swapi.co/api/people";
  List data;

  // Function to get the JSON data
  Future<String> getJSONData() async {
    var response = await http.get(
        Uri.encodeFull(url),
        headers: {"Accept": "application/json"});
    print(response.body);

    // To modify the state of the app, use this method
    setState(() {
      // Get the JSON data
      var dataConvertedToJSON = json.decode(response.body);
      // Extract the required part and assign it to the global variable named data
      data = dataConvertedToJSON['results'];
    });

    return "Successfull";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve JSON Data via HTTP GET"),
      ),
      // Create a Listview and load the data when available
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(
                  child: Column(
                    // Stretch the cards in horizontal axis
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        child: Container(
                          child: InkWell(
                            child: Text(
                              data[index]['name'],
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.purple),
                            ),
                            splashColor: Colors.amber,
                            onTap: () async {

                            },
                          ),
                          // added padding
                          padding: const EdgeInsets.all(14.0),
                        ),
                        borderOnForeground: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      )
                    ],
                  )),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }
}
