import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app_jobs/bloc/blocs.dart';
import 'package:flutter_test_app_jobs/widgets/city_selection.dart';
import 'package:flutter_test_app_jobs/widgets/info_weather.dart';
import 'package:flutter_test_app_jobs/widgets/last_update.dart';
import 'package:flutter_test_app_jobs/widgets/widget_all_temp.dart';
import 'package:flutter_test_app_jobs/widgets/widget_city_name.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 10.0, left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CitySelection(),
              Center(
                child: BlocConsumer<WeatherBloc, WeatherState>(
                  listener: (context, state) {
                    if (state is WeatherLoadSuccess) {
                      _refreshCompleter?.complete();
                      _refreshCompleter = Completer();
                    }
                  },
                  // ignore: missing_return
                  builder: (context, state) {
                    if (state is WeatherInitial) {
                      return Center(
                          child: Text(
                        "Please select a location!",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ));
                    }
                    if (state is WeatherLoadInProgress) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is WeatherLoadSuccess) {
                      final weather = state.weatherData;

                      return RefreshIndicator(
                        onRefresh: () {
                          BlocProvider.of<WeatherBloc>(context).add(
                            WeatherRefresh(
                                city: state.weatherData.currentLocationName),
                          );
                          return _refreshCompleter.future;
                        },
                        child: Container(
                          height: 500,
                          child: ListView(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 50.0),
                                child: Center(
                                  child: CityName(
                                    city: weather.currentLocationName,
                                  ),
                                ),
                              ),
                              Center(
                                child: LastUpdated(dateTime: weather.dt),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                child: CombinedWeatherTemperature(
                                  weatherData: weather,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: InfoWeather(
                                    weather: weather,
                                  )),
                            ],
                          ),
                        ),
                      );
                    }
                    if (state is WeatherLoadFailure) {
                      return Text(
                        'Something went wrong!',
                        style: TextStyle(color: Colors.red),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
