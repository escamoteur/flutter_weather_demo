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
            new Padding(padding: const EdgeInsets.all(5.0),child: 
              new TextField(autocorrect: false,
                            decoration: new InputDecoration(hintText: "Filter cities",
                                                            hintStyle: new TextStyle(color: new Color.fromARGB(150, 0, 0, 0)),
                                                            ),
                            style: new TextStyle(fontSize: 20.0,
                                                 color: new Color.fromARGB(255, 0, 0, 0)),
                            onChanged: TheViewModel.OnFilerEntryChanged,),
            ),

            new Expanded( child: new WeatherListView(TheViewModel)),  // Have to wrap the ListView into an Expanded otherwise the Column throws an exception
            
            new Padding(padding: const EdgeInsets.all(8.0),child: 
              new MaterialButton(
                            child: new Text("Update"),
                            color: new Color.fromARGB(255, 33, 150, 243),
                            textColor: new Color.fromARGB(255, 255, 255, 255),
                            onPressed: TheViewModel.update
                            ),
            ),
            
          ],
          ),
      )
    );
  }
}

