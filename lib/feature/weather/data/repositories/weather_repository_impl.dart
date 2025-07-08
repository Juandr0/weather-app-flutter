import 'package:weather_app_60min/feature/weather/data/services/api_service.dart';
import 'package:weather_app_60min/feature/weather/domain/entities/weather.dart';
import 'package:weather_app_60min/feature/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final ApiService apiService;

  WeatherRepositoryImpl({required this.apiService});

  @override
  Future<Weather> getWeather(String city) async {
    final weatherModel = await apiService.getQuery(city);
    return weatherModel.toEntity(weatherModel);
  }
}
