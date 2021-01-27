import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test_app_jobs/models/weather_model_city.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  final http.Client httpClient;
  static const baseHttp = "api.openweathermap.org/data/2.5/weather";
  static const ApiKey = "9b299738aea9e12eb588474b0f731bb7";

  WeatherApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<WeatherDataModel> getWeatherCity(String city) async {
    final urlCity = "http://$baseHttp?q=$city&appid=$ApiKey";
    final responseCity = await this.httpClient.get(urlCity);

    if (responseCity.statusCode != 200) {
      throw Exception("error get weather city");
    }
    return parseJsonCity(responseCity.body);
  }

  Future<WeatherDataModel> getWeatherLatandLon(double lat, double lon) async {
    final urlLatAndLon = "http://$baseHttp?lat=$lat&lon=$lon&appid=$ApiKey";
    final responseLatAndLon = await this.httpClient.get(urlLatAndLon);

    if (responseLatAndLon.statusCode != 200) {
      throw Exception("Error get weather lan and lon");
    }
    return jsonDecode(responseLatAndLon.body);
  }

  WeatherDataModel parseJsonCity(final response) {
    Map jsonDecode = json.decode(response);
    return WeatherDataModel.fromJson(jsonDecode);
  }
}
