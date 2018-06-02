import 'package:flutter_weather_demo/app_model.dart';
import 'package:get_it/get_it.dart';

// ambient variable to access the service locator
GetIt sl = new GetIt();

void setup() {
      sl.registerSingleton<AppModel>(new AppModel());
}