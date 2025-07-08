import 'package:flutter/material.dart';
import 'package:weather_app_60min/core/utils/add_https.dart';
import 'package:weather_app_60min/feature/weather/domain/entities/weather.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      elevation: 4,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxHeight: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Vädret just nu",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                weather.location,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    weather.weatherDescription,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.network(
                    addHttps(weather.iconUrl),
                    width: 32,
                    height: 32,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${weather.tempC.toStringAsFixed(1)} °C',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
