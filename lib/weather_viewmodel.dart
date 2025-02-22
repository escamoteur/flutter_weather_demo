import 'dart:convert';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;

import 'json/weather_in_cities.dart';

class WeatherViewModel {
  final _newWeatherSubject = BehaviorSubject<List<WeatherEntry>>();
  final _inputSubject = BehaviorSubject<String>();

  Stream<List<WeatherEntry>> get newWeatherEvents => _newWeatherSubject.stream;

  // Callback function that will be registered to the TextFields OnChanged Event
  OnFilerEntryChanged(String s) => _inputSubject.add(s);

  WeatherViewModel() {
    update();

    // initialize input listener for the Searchfield
    _inputSubject.stream
        .debounceTime(Duration(
            milliseconds:
                500)) // make sure we start processing if the user make a short pause
        .listen((filterText) {
      update(filtertext: filterText);
    });
  }

  update({String filtertext = ""}) {
    const String url =
        "http://api.openweathermap.org/data/2.5/box/city?bbox=5,47,14,54,20&appid=27ac337102cc4931c24ba0b50aca6bbd";

    var httpStream = (http.get(Uri.parse(url)).asStream());

    _newWeatherSubject.addStream(httpStream
        .where(
            (data) => data.statusCode == 200) // only continue if valid response
        .map((data) // convert JSON result in ModelObject
            {
      return WeatherInCities.fromJson(json.decode(data.body))
          .cities
          .where((weatherInCity) =>
              filtertext.isEmpty ||
              weatherInCity.name
                  .toUpperCase()
                  .startsWith(filtertext.toUpperCase()))
          .map((weatherInCity) => WeatherEntry(weatherInCity))
          .toList();
    }));
  }
}

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
