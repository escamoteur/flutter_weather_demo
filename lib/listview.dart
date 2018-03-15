import 'package:flutter/material.dart';
import 'main.dart';
import 'weather_viewmodel.dart';

class WeatherListView extends StatelessWidget {


  WeatherListView();
    @override
    Widget build(BuildContext context) {
      return new StreamBuilder<List<WeatherEntry>>(
              stream: TheViewModel.of(context).WeatherStream,   //We access our ViewModel through the inherited Widget
              builder: (BuildContext context, AsyncSnapshot<List<WeatherEntry>> snapshot)  {
                          if (snapshot.hasData && snapshot.data.length > 0)
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
      return 
        new Wrap(spacing: 40.0,
              children: <Widget>
              [
                new Image(image: new NetworkImage(listData[index].iconURL)),
                
                new Text(listData[index].city, style: new TextStyle(fontSize: 20.0))
              ],);
        
      
    }
}
      
  
 