class Weather {
  final String location;
  final double tempC;
  final String weatherDescription;
  final String iconUrl;

  Weather(
      {required this.location,
      required this.tempC,
      required this.weatherDescription,
      required this.iconUrl});
}
