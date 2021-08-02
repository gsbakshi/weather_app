class WeatherApiException implements Exception {
  const WeatherApiException(this.message);
  final String message;
}
