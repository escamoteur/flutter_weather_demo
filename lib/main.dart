import 'package:flutter/material.dart';
import 'service_locator.dart';

import 'homepage.dart';


void main() {
  setup();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

 

 
  @override
  Widget build(BuildContext context) {
    return  
          new MaterialApp(
            title: 'Flutter Demo',
            home: new HomePage()
          );
  }
}


