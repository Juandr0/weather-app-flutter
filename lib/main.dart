import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_60min/feature/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app_60min/feature/weather/data/services/api_service.dart';
import 'package:weather_app_60min/feature/weather/domain/usecases/get_weather_use_case.dart';
import 'package:weather_app_60min/feature/weather/logic/cubit/weather_cubit.dart';

import 'feature/weather/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    final weatherRepository = WeatherRepositoryImpl(apiService: apiService);
    final getWeatherUseCase = GetWeatherUseCase(weatherRepository);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (_) => WeatherCubit(getWeatherUseCase),
          child: const HomePage()),
    );
  }
}
