import 'package:flutter/material.dart';
import 'package:flutter_weather_demo/weather_viewmodel.dart';

class DetailPage extends StatelessWidget {
  final WeatherEntry weatherEntry;

  DetailPage(this.weatherEntry);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail View")),
        body: Container(
            padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        weatherEntry.cityName,
                        style: TextStyle(fontSize: 35.0),
                      ),
                    ),
                    weatherEntry.iconURL == null
                        ? SizedBox()
                        : Image.network(
                            weatherEntry.iconURL!,
                            alignment: Alignment.center,
                            scale: 1.0,
                            repeat: ImageRepeat.noRepeat,
                            width: 120.0,
                            height: 120.0,
                            fit: BoxFit.contain,
                          )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Condition:",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        weatherEntry.description ?? "",
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Temperature:",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        weatherEntry.temperature.toStringAsFixed(1) + "°",
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Wind:",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        weatherEntry.wind.toStringAsFixed(1) + " m/s",
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ]),
                ),
              ],
            )));
  }
}
