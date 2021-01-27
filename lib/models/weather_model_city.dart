class WeatherDataModel {
  final double latitude;
  final double longitude;
  final double temperature;
  final double temperatureMax;
  final double temperatureMin;
  final String weatherMain;
  final String currentLocationName;
  final DateTime dt;
  final String currentConditions;
  final String wind;
  final String humidity;

  double get getTemperature => temperature;

  WeatherDataModel({
    this.wind,
    this.humidity,
    this.latitude,
    this.longitude,
    this.temperature,
    this.temperatureMax,
    this.temperatureMin,
    this.currentLocationName,
    this.dt,
    this.weatherMain,
    this.currentConditions,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
      temperature: json["main"]["temp"],
      temperatureMax: json["main"]["temp_max"],
      temperatureMin: json["main"]["temp_min"],
      weatherMain: json["weather"][0]["main"],
      humidity: json["main"]["humidity"].toString(),
      currentLocationName: json["name"],
      currentConditions: json["weather"][0]["description"],
      dt: DateTime.now(),
      wind: json["wind"]["speed"].toString(),
      latitude: json["coord"]["lat"],
      longitude: json["coord"]["lon"],
    );
  }
}
