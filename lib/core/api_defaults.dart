import 'package:weather_app_60min/core/api_key.dart';

class ApiDefaults {
  static const String baseUrl =
      "https://api.weatherapi.com/v1/current.json?&aqi=no";

  static String getQuery(String query) {
    return "${ApiDefaults.baseUrl}&$apiKey&q=$query";
  }
}
