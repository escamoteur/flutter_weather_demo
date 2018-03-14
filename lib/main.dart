import 'package:flutter/material.dart';

import 'listview.dart';
import 'weather_viewmodel.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final TheViewModel = new WeatherViewModel();

  @override
  Widget build(BuildContext context) {
    TheViewModel.update();
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(title: new Text("WeatherDemo")),
        body: new Column(children: <Widget>
          [
            new Expanded( child: new WeatherListView(TheViewModel)),
            new MaterialButton(child: new Text("Update"),
                              
                              onPressed: TheViewModel.update
                              ),
            
          ],
          ),
      )
    );
  }
}

