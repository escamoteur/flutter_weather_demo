import 'package:flutter_weather_demo/app_model.dart';
import 'package:flutter_weather_demo/services/weather_api_emulation.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_weather_demo/services/weather_api.dart';

// ambient variable to access the service locator
GetIt sl = GetIt.instance;

void setup() {
  // Important to register services that might be used in AppModel constructor first
  sl.registerSingleton<WeatherAPI>(WeatherAPIEmulation());
  //    sl.registerSingleton<WeatherAPI>(WeatherAPIOpenWeatherMap() );
  sl.registerSingleton<AppModel>(AppModel());
}
