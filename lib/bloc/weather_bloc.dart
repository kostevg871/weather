import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app_jobs/bloc/blocs.dart';
import 'package:flutter_test_app_jobs/bloc/weather_event.dart';
import 'package:flutter_test_app_jobs/models/weather_model_city.dart';
import 'package:flutter_test_app_jobs/repositories/repositories.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  double latitude;
  double longitude;

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield* _mapEventRequestToState(event);
    } else if (event is WeatherRefresh) {
      yield* _mapEventRefreshRequested(event);
    }
  }

  Stream<WeatherState> _mapEventRequestToState(WeatherRequested event) async* {
    yield WeatherLoadInProgress();
    try {
      final WeatherDataModel weather =
          await weatherRepository.getWeatherCity(event.city);
      yield WeatherLoadSuccess(weatherData: weather);
    } catch (_) {
      yield WeatherLoadFailure();
    }
  }

  Stream<WeatherState> _mapEventRefreshRequested(WeatherRefresh event) async* {
    try {
      final WeatherDataModel weather =
          await weatherRepository.getWeatherCity(event.city);
      yield WeatherLoadSuccess(weatherData: weather);
    } catch (_) {}
  }
}
