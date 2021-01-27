import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app_jobs/app.dart';
import 'package:flutter_test_app_jobs/observed.dart';
import 'package:flutter_test_app_jobs/repositories/repositories.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlockObserver();
  final WeatherRepository weatherRepository = WeatherRepository(
      weatherApiClient: WeatherApiClient(
    httpClient: http.Client(),
  ));

  runApp(App(weatherRepository: weatherRepository));
}
