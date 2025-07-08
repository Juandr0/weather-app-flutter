import 'package:dio/dio.dart';
import 'package:weather_app_60min/core/api_defaults.dart';
import 'package:weather_app_60min/feature/weather/data/models/weather_model.dart';

class ApiService {
  final dio = Dio();

  Future<WeatherModel> getQuery(String query) async {
    try {
      final response = await dio.get(ApiDefaults.getQuery(query));
      if (response.data != null) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception("No data in response");
      }
    } catch (e) {
      throw Exception("Error fetching weather: $e");
    }
  }
}
