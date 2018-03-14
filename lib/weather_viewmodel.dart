import 'dart:convert';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;

import 'json/weather_in_cities.dart';


typedef void InputChange(String); 

  class WeatherViewModel {
  

    final _weatherSubject = new BehaviorSubject<List<WeatherEntry>>() ;
    final _InputSubject = new BehaviorSubject<String>() ;


    Observable<List<WeatherEntry>> get WeatherStream  => _weatherSubject.observable;


    // Callback function that will be registered to the TextFields OnChanged Event
    OnFilerEntryChanged(String s) => _InputSubject.add; 


    WeatherViewModel()
    {
        _InputSubject.observable
          .debounce( new Duration(milliseconds: 500))
            .listen( (filterText)
            {
              update( filtertext: filterText);
            });  
    }



    update({String filtertext = ""})
    {
        
      const String url = "http://api.openweathermap.org/data/2.5/box/city?bbox=5,47,14,54,20&appid=27ac337102cc4931c24ba0b50aca6bbd";  
      

      var httpStream = new Observable(http.get(url).asStream()); 

        _weatherSubject.addStream(
            httpStream
              .map( (data) 
              {
                if (data.statusCode == 200)
                    {
                        return new WeatherInCities.fromJson(JSON.decode(data.body)).Cities
                          .where( (city) =>  filtertext.isEmpty || city.Name.toUpperCase().startsWith(filtertext.toUpperCase()))
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
