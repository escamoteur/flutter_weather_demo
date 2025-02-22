import 'package:flutter/material.dart';
import 'package:flutter_weather_demo/app_model.dart';
import 'package:flutter_weather_demo/di.dart';

import 'listview.dart';

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
              onChanged: di<AppModel>().OnFilerEntryChanged,
            ),
          ),

          Expanded(
              child:
                  WeatherListView()), // Have to wrap the ListView into an Expanded otherwise the Column throws an exception

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                child: Text("Update"),
                color: Color.fromARGB(255, 33, 150, 243),
                textColor: Color.fromARGB(255, 255, 255, 255),
                onPressed: di.get<AppModel>().update),
          ),
        ],
      ),
    );
  }
}
