import 'package:weather_app_60min/feature/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
      {required super.location,
      required super.tempC,
      required super.weatherDescription,
      required super.iconUrl});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final location = json['location']['name'];
    final tempC = json['current']['temp_c'];
    final description = json['current']['condition']['text'];
    final icon = json['current']['condition']['icon'];

    return WeatherModel(
      location: location,
      tempC: tempC.toDouble(),
      weatherDescription: description,
      iconUrl: icon,
    );
  }

  Weather toEntity(WeatherModel weather) {
    return Weather(
        location: weather.location,
        tempC: weather.tempC,
        weatherDescription: weather.weatherDescription,
        iconUrl: weather.iconUrl);
  }
}
