import 'dart:async';
import 'dart:convert';

import 'package:flutter_weather_demo/app_model.dart';
import 'package:flutter_weather_demo/json/weather_in_cities.dart';
import 'package:flutter_weather_demo/services/weather_api.dart';

class WeatherAPIEmulation implements WeatherAPI {
  Stream<List<WeatherEntry>> getWeatherEntries(String filterText) {
    return Stream.fromIterable([
      WeatherInCities.fromJson(json.decode(api_data))
          .cities
          .where((weatherInCity) =>
              filterText.isEmpty ||
              weatherInCity.name
                  .toUpperCase()
                  .startsWith(filterText.toUpperCase()))
          .map((weatherInCity) => WeatherEntry(weatherInCity))
          .toList()
    ]);
  }
}

const api_data = '''{
    "cod": 200,
    "calctime": 1.420685659,
    "cnt": 1284,
    "list": [
        {
            "id": 3021263,
            "dt": 1528106508,
            "name": "City 1",
            "coord": {
                "Lat": 47.099998,
                "Lon": 5.5
            },
            "main": {
                "temp": 23,
                "temp_min": 23,
                "temp_max": 23,
                "pressure": 1012,
                "humidity": 69
            },
            "wind": {
                "speed": 1.5,
                "deg": 330
            },
            "rain": null,
            "snow": null,
            "clouds": {
                "today": 75
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ]
        },
        {
            "id": 3025496,
            "dt": 1528106556,
            "name": "City 2",
            "coord": {
                "Lat": 47.293228,
                "Lon": 5.00457
            },
            "main": {
                "temp": 23,
                "temp_min": 23,
                "temp_max": 23,
                "pressure": 1012,
                "humidity": 64
            },
            "wind": {
                "speed": 1,
                "deg": 0
            },
            "rain": null,
            "snow": null,
            "clouds": {
                "today": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ]
        },
        {
            "id": 3021372,
            "dt": 1528106723,
            "name": "City 3",
            "coord": {
                "Lat": 47.316669,
                "Lon": 5.01667
            },
            "main": {
                "temp": 23,
                "temp_min": 23,
                "temp_max": 23,
                "pressure": 1012,
                "humidity": 64
            },
            "wind": {
                "speed": 1,
                "deg": 0
            },
            "rain": null,
            "snow": null,
            "clouds": {
                "today": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ]
        }
    ]
}''';
