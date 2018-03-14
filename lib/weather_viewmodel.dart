import 'dart:convert';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;

import 'weather_in_cities.dart';

  class WeatherViewModel {
  

    final _weatherSubject = new BehaviorSubject<List<WeatherEntry>>() ;

    Observable<List<WeatherEntry>> get WeatherStream  => _weatherSubject.observable;



    update()
    {
        
      String url = "http://api.openweathermap.org/data/2.5/box/city?bbox=5,47,14,54,20&appid=27ac337102cc4931c24ba0b50aca6bbd";  
      
      

      var httpStream = new Observable(http.get(url).asStream()); 

        _weatherSubject.addStream(
            httpStream
              .map( (data) 
              {
                    if (data.statusCode == 200)
                    {
                        return new WeatherInCities.fromJson(JSON.decode(data.body)).Cities
                          .map((city) => new WeatherEntry(city.Name, getIconURL(city)))
                                                      .toList();
                                              }
                                              else
                                              {
                                                return null;
                                              }           
                                        }));
                               
                               }


          String getIconURL(City city) {
              return city.weather != Null ?  "http://openweathermap.org/img/w/${city.weather[0].Icon}.png" :  null;
          }

 
    }
                          
 

class WeatherEntry {
  final String city;
  final String iconURL;

  WeatherEntry(this.city, this.iconURL);
}
