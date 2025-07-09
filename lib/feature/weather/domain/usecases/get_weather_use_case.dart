import 'package:weather_app_60min/feature/weather/domain/entities/weather.dart';
import 'package:weather_app_60min/feature/weather/domain/repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository _repo;

  GetWeatherUseCase(this._repo);

  Future<Weather> call(String city) {
    return _repo.getWeather(city);
  }
}
