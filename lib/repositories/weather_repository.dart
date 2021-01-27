import 'package:flutter/cupertino.dart';
import 'package:flutter_test_app_jobs/models/weather_model_city.dart';
import 'package:flutter_test_app_jobs/repositories/repositories.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<WeatherDataModel> getWeatherCity(String city) async {
    return weatherApiClient.getWeatherCity(city);
  }

  Future<WeatherDataModel> getWeatherLatAndLon(double lat, double lon) async {
    return weatherApiClient.getWeatherLatandLon(lat, lon);
  }
}
