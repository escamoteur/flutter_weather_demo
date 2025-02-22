import 'package:flutter_weather_demo/di.dart';
import 'package:flutter_weather_demo/services/weather_api.dart';
import 'package:rxdart/rxdart.dart';

import 'json/weather_in_cities.dart';

class WeatherEntry {
  late String cityName;
  String? iconURL;
  late double wind;
  late double rain;
  late double temperature;
  String? description;

  WeatherEntry(City city) {
    this.cityName = city.name;
    this.iconURL = city.weather[0].icon != null
        ? "https://openweathermap.org/img/w/${city.weather[0].icon}.png"
        : null;
    this.description = city.weather[0].description;
    this.wind = city.wind.speed.toDouble();
    this.rain = city.rain;
    this.temperature = city.main.temp;
  }
}

class AppModel {
  final _weatherSubject = BehaviorSubject<List<WeatherEntry>>();
  final _InputSubject = BehaviorSubject<String>();

  Stream<List<WeatherEntry>> get WeatherStream => _weatherSubject;

  // Callback function that will be registered to the TextFields OnChanged Event
  OnFilerEntryChanged(String s) => _InputSubject.add(s);

  AppModel() {
    update();

    _InputSubject.debounceTime(Duration(milliseconds: 500))
        .listen((filterText) {
      update(filtertext: filterText);
    });
  }

  update({String filtertext = ""}) {
    _weatherSubject.addStream(di<WeatherAPI>().getWeatherEntries(filtertext));
  }
}
