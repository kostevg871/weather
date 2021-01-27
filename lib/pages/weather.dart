import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app_jobs/bloc/blocs.dart';
import 'package:flutter_test_app_jobs/widgets/city_selection.dart';
import 'package:flutter_test_app_jobs/widgets/last_update.dart';
import 'package:flutter_test_app_jobs/widgets/widget_all_temp.dart';
import 'package:flutter_test_app_jobs/widgets/widget_city_name.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text("Test app weather"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitySelection(),
                ),
              );
              if (city != null) {
                BlocProvider.of<WeatherBloc>(context)
                    .add(WeatherRequested(city: city));
              }
            },
          )
        ],
      ),
      body: Center(
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
                style: TextStyle(color: Colors.white),
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
                    WeatherRefresh(city: state.weatherData.currentLocationName),
                  );
                  return _refreshCompleter.future;
                },
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Center(
                        child: CityName(city: weather.currentLocationName),
                      ),
                    ),
                    Center(
                      child: LastUpdated(dateTime: weather.dt),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.0),
                      child: Center(
                        child: CombinedWeatherTemperature(
                          weatherData: weather,
                        ),
                      ),
                    ),
                  ],
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
    );
  }
}
