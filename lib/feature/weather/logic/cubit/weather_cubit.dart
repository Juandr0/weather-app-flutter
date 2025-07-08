import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_60min/feature/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app_60min/feature/weather/logic/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repository;

  WeatherCubit(this.repository) : super(WeatherInitial());

  Future<void> fetchWeather(String city) async {
    emit(WeatherLoading());
    try {
      final weather = await repository.getWeather(city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
