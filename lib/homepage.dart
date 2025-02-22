import 'package:flutter/material.dart';

import 'listview.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WeatherDemo")),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              autocorrect: false,
              decoration: InputDecoration(
                hintText: "Filter cities",
                hintStyle: TextStyle(color: Color.fromARGB(150, 0, 0, 0)),
              ),
              style: TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
              onChanged: TheViewModel.of(context).OnFilerEntryChanged,
            ),
          ),

          Expanded(
              child:
                  WeatherListView()), // Have to wrap the ListView into an Expanded otherwise the Column throws an exception

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
                child:
                    Text("Update"), // Watch the Button is again a composition
                color: Color.fromARGB(255, 33, 150, 243),
                textColor: Color.fromARGB(255, 255, 255, 255),
                onPressed: TheViewModel.of(context).update),
          ),
        ],
      ),
    );
  }
}
