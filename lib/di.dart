import 'package:flutter_weather_demo/app_model.dart';
import 'package:flutter_weather_demo/services/weather_api.dart';
import 'package:flutter_weather_demo/services/weather_api_open_weather_map.dart';
import 'package:watch_it/watch_it.dart';

void setup() {
  // Important to register services that might be used in AppModel constructor first
  // di.registerSingleton<WeatherAPI>(WeatherAPIEmulation());
  di.registerSingleton<WeatherAPI>(WeatherAPIOpenWeatherMap());
  di.registerSingleton<AppModel>(AppModel());
}
