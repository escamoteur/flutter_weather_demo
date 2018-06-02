import 'package:flutter/material.dart';

import 'app_model.dart';

class DetailPage extends StatelessWidget
{

  final WeatherEntry weatherEntry;

  DetailPage(this.weatherEntry);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Detail View")),
      body: new Container(padding: new EdgeInsets.only(left: 20.0,bottom: 10.0),
                          child: 
                    new Column(children: <Widget>
                    [
                      new Row(
                        children: <Widget>[
                          new Expanded(child: 

                            new Text(weatherEntry.cityName,
                                      style: new TextStyle(fontSize: 35.0),),),

                            new Image.network(weatherEntry.iconURL,
                                      alignment: Alignment.center,
                                      scale: 1.0,
                                      repeat: ImageRepeat.noRepeat,
                                      width: 120.0,
                                      height: 120.0,
                                      fit: BoxFit.contain,)
                        ],
                      ),
                     new Padding(
                       padding: const EdgeInsets.only(bottom: 10.0),
                       child: new Row(
                          children: <Widget>
                          [
                                new Expanded(flex: 1,
                                         child: new Text("Condition:",
                                                          style: new TextStyle(fontSize: 20.0),),
                                ),
                                new Expanded(flex: 1,
                                              child: 

                                    new Text(weatherEntry.description,
                                              style: new TextStyle(fontSize: 20.0),
                                              textAlign: TextAlign.start,
                                              ),
                                              ),
                         ]),
                     ),
                     new Padding(
                       padding: const EdgeInsets.only(bottom: 10.0),
                       child: new Row(
                          children: <Widget>
                          [
                                new Expanded(flex: 1,
                                         child: new Text("Temperature:",
                                                          style: new TextStyle(fontSize: 20.0),),
                                ),
                                new Expanded(flex: 1,
                                              child: 

                                    new Text(weatherEntry.temperature.toStringAsFixed(1) + "°",
                                              style: new TextStyle(fontSize: 20.0),
                                              textAlign: TextAlign.start,
                                              ),
                                              ),
                         ]),
                     ),
                     new Padding(
                       padding: const EdgeInsets.only(bottom: 10.0),
                       child: new Row(
                          children: <Widget>
                          [
                                new Expanded(flex: 1,
                                         child: new Text("Wind:",
                                                          style: new TextStyle(fontSize: 20.0),),
                                ),
                                new Expanded(flex: 1,
                                              child: 

                                    new Text(weatherEntry.wind.toStringAsFixed(1) + " m/s",
                                              style: new TextStyle(fontSize: 20.0),
                                              textAlign: TextAlign.start,
                                              ),
                                              ),
                         ]),
                     ),

                     

                    ],
                    )
                )
      );
                    
  }
  
}