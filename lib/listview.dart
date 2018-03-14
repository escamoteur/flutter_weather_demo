import 'package:flutter/material.dart';
import 'weather_viewmodel.dart';

class WeatherListView extends StatelessWidget {

  final WeatherViewModel  model;

  WeatherListView(this.model);
  
    @override
    Widget build(BuildContext context) {
      return new StreamBuilder<List<WeatherEntry>>(
              stream: model.WeatherStream,
              builder: (BuildContext context, AsyncSnapshot<List<WeatherEntry>> snapshot)  {
                          if (snapshot.hasData)
                          {
                             return new ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder : (BuildContext context, int index) => buildRow(context,index,snapshot.data)
                                            
                            );
                          }
                          else
                          {
                            return new Text("No items");
                          }
                      }                                              
              );
                            
    }            
                  
    Widget buildRow(BuildContext context, int index, List<WeatherEntry> listData) {
      return new ListTile(
        title: new Text(listData[index].city),
      );
    }
}
      
  
 