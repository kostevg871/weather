import 'package:flutter/material.dart';
import 'package:flutter_test_app_jobs/models/weather_model_city.dart';
import 'package:google_fonts/google_fonts.dart';

import 'temp.dart';

class CombinedWeatherTemperature extends StatelessWidget {
  final WeatherDataModel weatherData;

  CombinedWeatherTemperature({
    Key key,
    @required this.weatherData,
  })  : assert(weatherData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Temperature(
                temperature: weatherData.temperature,
                high: weatherData.temperatureMax,
                low: weatherData.temperatureMin,
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            weatherData.currentConditions,
            style: GoogleFonts.lato(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
