import 'package:flutter/material.dart';
import 'package:flutter_test_app_jobs/models/weather_model_city.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoWeather extends StatelessWidget {
  final WeatherDataModel weather;

  InfoWeather({@required this.weather}) : assert(weather != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            Text(
              "Humidity",
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "${weather.humidity} %",
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Speed Wind",
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "${weather.wind} m/c",
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
