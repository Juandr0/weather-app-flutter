import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_60min/feature/weather/logic/cubit/weather_cubit.dart';
import 'package:weather_app_60min/feature/weather/logic/cubit/weather_state.dart';
import 'package:weather_app_60min/feature/weather/presentation/widgets/custom_search_bar.dart';
import 'package:weather_app_60min/feature/weather/presentation/widgets/weather_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather data"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final cubit = context.read<WeatherCubit>();
              if (cubit.state is WeatherLoaded) {
                final loadedState = cubit.state as WeatherLoaded;
                cubit.fetchWeather(loadedState.weather.location);
              }
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSearchBar(
            onSearch: (city) => {
              context.read<WeatherCubit>().fetchWeather(city),
            },
          ),
          Expanded(
            child: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WeatherLoaded) {
                  return WeatherCard(weather: state.weather);
                } else if (state is WeatherError) {
                  return Text('Fel: ${state.message}');
                } else {
                  return const Text("Sök efter en stad för att få väder");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
