import 'package:flutter/material.dart';
import 'package:flutter_test_app_jobs/models/weather_model_city.dart';

class WeatherConditions extends StatelessWidget {
  final WeatherDataModel weatherData;

  WeatherConditions({Key key, @required this.weatherData})
      : assert(weatherData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(weatherData.currentConditions);
  }
}
