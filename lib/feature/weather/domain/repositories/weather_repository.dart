import 'package:weather_app_60min/feature/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(String city);
}
