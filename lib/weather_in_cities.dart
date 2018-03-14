import "package:json_annotation/json_annotation.dart";    

part "weather_in_cities.g.dart";  

    @JsonSerializable()
    class WeatherInCities extends Object with _$WeatherInCitiesSerializerMixIn
    {
        WeatherInCities(this.Cnt, this.Calctime, this.Cod, this.Cities);


        @JsonKey(name: 'cnt')
        final int Cnt ;

        @JsonKey(name: 'calctime')
        final double Calctime ;

        @JsonKey(name: 'cod')
        final int Cod ;

        @JsonKey(name: 'list')
        final List<City> Cities ;

        factory WeatherInCities.fromJson(Map<String,dynamic> json) => _$WeatherInCities(json);
    }

    @JsonSerializable()
    class City extends Object with _$CitySerializerMixIn
    {

        City(this.Id, this.coord, this.clouds, this.Dt, this.Name, this.main, this.rain, this.weather, this.wind);

        @JsonKey(name: 'id')
        final int Id ;

        @JsonKey(name: 'coord')
        final Coord coord ;

        @JsonKey(name: 'clouds')
        final Clouds clouds ;

        @JsonKey(name: 'dt')
        final int Dt ;

        @JsonKey(name: 'name')
        final String Name ;

    
        @JsonKey(name: 'main')
        final Main main ;

        @JsonKey(name: 'rain')
        final Rain rain ;

        @JsonKey(name: 'weather')
        final List<Weather> weather ;

        @JsonKey(name: 'wind')
        final Wind wind ;

        factory City.fromJson(Map<String,dynamic> json) => _$City(json);


    }

    @JsonSerializable()
    class Coord extends Object with _$CoordSerializerMixIn
    {
        Coord(this.Lat, this.Lon);

        @JsonKey(name: 'Lat')
        final double Lat ;

        @JsonKey(name: 'Lon')
        final double Lon ;

        factory Coord.fromJson(Map<String,dynamic> json) => _$Coord(json);

    }

    @JsonSerializable()
    class Clouds extends Object with _$CloudsSerializerMixIn
    {

        Clouds(this.Today);

        @JsonKey(name: 'today')
        final int Today ;

        factory Clouds.fromJson(Map<String,dynamic> json) => _$Clouds(json);

    }

    @JsonSerializable()
    class Main extends Object with _$MainSerializerMixIn
    {
        Main(this.SeaLevel, this.Humidity, this.GrndLevel, this.Pressure, this.TempMax, this.Temp, this.TempMin); 


        @JsonKey(name: 'sea_level', nullable: true)
        final double SeaLevel ;

        @JsonKey(name: 'humidity')
        final int Humidity ;

        @JsonKey(name: 'grnd_level',nullable: true)
        final double GrndLevel ;

        @JsonKey(name: 'pressure')
        final double Pressure ;

        @JsonKey(name: 'temp_max')
        final double TempMax ;

        @JsonKey(name: 'temp')
        final double Temp ;

        @JsonKey(name: 'temp_min')
        final double TempMin ;



        factory Main.fromJson(Map<String,dynamic> json) => _$Main(json);
    
    }

    @JsonSerializable()
    class Rain extends Object with _$RainSerializerMixIn
    {

        Rain(this.The3h);

        @JsonKey(name: '3h')
        final double The3h ;

        factory RainCities.fromJson(Map<String,dynamic> json) => _$Rain(json);

    }

    @JsonSerializable()
    class Weather extends Object with _$WeatherSerializerMixIn
    {

        Weather(this.Icon, this.Description, this.Id, this.Main);

        @JsonKey(name: 'icon')
        final String Icon ;

        @JsonKey(name: 'description')
        final String Description ;

        @JsonKey(name: 'id')
        final int Id ;

        @JsonKey(name: 'main')
        final String Main ;

        factory Weather.fromJson(Map<String,dynamic> json) => _$Weather(json);


    }

    @JsonSerializable()
    class Wind extends Object with _$WindSerializerMixIn
    {
        Wind(this.Deg, this.Speed);

        @JsonKey(name: 'deg')
        final double Deg ;

        @JsonKey(name: 'speed')
        final double Speed ;

        factory Wind.fromJson(Map<String,dynamic> json) => _$Wind(json);
        
    }