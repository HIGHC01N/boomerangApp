class ThisWeekWeatherInfo {
  final String day;
  final String imageURL;
  final String weatherState;
  final int maximumTemperature;
  final int minimumTemperature;

  const ThisWeekWeatherInfo({
    required this.day,
    required this.imageURL,
    required this.weatherState,
    required this.maximumTemperature,
    required this.minimumTemperature,
  });
}