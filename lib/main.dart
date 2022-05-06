import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/weather/weather.dart';

void main() {
  final weatherReportRepository = WeatherReportRepositoryImpl(
    api: WeatherAPI(),
  );
  runApp(
    RepositoryProvider<IWeatherReportRepository>.value(
      value: weatherReportRepository,
      child: const App(),
    ),
  );
}
