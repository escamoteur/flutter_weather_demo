import 'dart:async';
import 'package:rxdart/rxdart.dart';


  class WeatherViewModel {
  

    final _weatherSubject = new BehaviorSubject<List<WeatherEntry>>() ;

    Observable<List<WeatherEntry>> get WeatherStream  => _weatherSubject.observable;

    update()
    {
        _weatherSubject.add( [ new WeatherEntry("Bonn"), 
                              new WeatherEntry("Berlin"),
                              new WeatherEntry("Köln"),
                              new WeatherEntry("Düsseldorf"),
                              new WeatherEntry("New York")]);
    }
  }


class WeatherEntry {
  final String city;

  WeatherEntry(this.city);
}
