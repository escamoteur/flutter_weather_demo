import 'dart:async';

import 'package:flutter_weather_demo/app_model.dart';

abstract class WeatherAPI
{

  Stream<List<WeatherEntry>> getWeatherEntries(String filterText); 
}