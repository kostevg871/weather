import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app_jobs/models/weather_model_city.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final WeatherDataModel weatherData;

  const WeatherLoadSuccess({@required this.weatherData})
      : assert(weatherData != null);
  @override
  List<Object> get props => [weatherData];
}

class WeatherLoadFailure extends WeatherState {}
