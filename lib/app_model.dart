import 'package:flutter_weather_demo/service_locator.dart';
import 'package:flutter_weather_demo/services/weather_api.dart';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;

import 'json/weather_in_cities.dart';

class WeatherEntry {
  String cityName;
  String iconURL;
  double wind;
  double rain;
  double temperature;
  String description;

  WeatherEntry(City city) {
    this.cityName = city.Name;
    this.iconURL = city.weather != null
        ? "http://openweathermap.org/img/w/${city.weather[0].Icon}.png"
        : null;
    this.description =
        city.weather != null ? city.weather[0].Description : null;
    this.wind = city.wind.Speed;
    this.rain = rain;
    this.temperature = city.main.Temp;
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
    _weatherSubject.addStream(sl<WeatherAPI>().getWeatherEntries(filtertext));
  }
}
