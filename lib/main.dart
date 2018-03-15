import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'homepage.dart';
import 'listview.dart';
import 'weather_viewmodel.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

 

 
  @override
  Widget build(BuildContext context) {
    return new TheViewModel( 
                  TheModel:  new WeatherViewModel(),child: 
                  new MaterialApp(
                    title: 'Flutter Demo',
                    home: new HomePage()


                  ),
    );
  }
}



class TheViewModel extends InheritedWidget
{
  final WeatherViewModel TheModel;

  const TheViewModel({Key key, 
                      @required 
                      this.TheModel, 
                      @required 
                      Widget child}) :  assert(TheModel != null),assert(child != null),
                      super(key: key, child: child);

  static WeatherViewModel of(BuildContext context) => (context.inheritFromWidgetOfExactType(TheViewModel)as TheViewModel).TheModel;                  


  @override
  bool updateShouldNotify(TheViewModel oldWidget) => TheModel != oldWidget.TheModel;
  
}

