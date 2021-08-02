import 'dart:io';

import 'package:weather_app/helpers/weather_api_exception.dart';
import 'package:weather_app/weather_api_client.dart';

Future<void> main(List<String> args) async {
  if (args.length != 1) {
    print('Usage: dart bin/main.dart <city>');
    return;
  }
  final city = args.first;
  final api = WeatherApiClient();
  try {
    final weather = await api.getWeather(city);
    print('\n$weather');
  } on WeatherApiException catch (error) {
    print(error.message);
  } on SocketException catch (error) {
    print(error.message);
    print('Could not fetch data. Check your connection.');
  } catch (error) {
    print(error);
  }
  print(
      '\n----------------\nData Sourced by MetaWeather.com\n----------------\n');
}
