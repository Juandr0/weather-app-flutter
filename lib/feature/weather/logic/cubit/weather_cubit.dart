import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_60min/feature/weather/domain/usecases/get_weather_use_case.dart';
import 'package:weather_app_60min/feature/weather/logic/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase _getWeatherUseCase;

  WeatherCubit(this._getWeatherUseCase) : super(WeatherInitial());

  Future<void> fetchWeather(String city) async {
    emit(WeatherLoading());
    try {
      final weather = await _getWeatherUseCase.call(city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
