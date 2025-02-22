import 'package:flutter/material.dart';

import 'homepage.dart';
import 'weather_viewmodel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return TheViewModel(
      theModel: WeatherViewModel(),
      child: MaterialApp(title: 'Flutter Demo', home: HomePage()),
    );
  }
}

// This might seem a bit odd
// InheritedWidgets allow you to propagate values down the widgettree.
// it can then be accessed by just writing  TheViewModel.of(context)
class TheViewModel extends InheritedWidget {
  final WeatherViewModel theModel;

  const TheViewModel(
      {super.key, @required required this.theModel, required super.child});

  static WeatherViewModel of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TheViewModel>()!.theModel;

  @override
  bool updateShouldNotify(TheViewModel oldWidget) =>
      theModel != oldWidget.theModel;
}
