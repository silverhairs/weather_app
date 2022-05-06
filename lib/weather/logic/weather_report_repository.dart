import 'package:weather_app/weather/data/models/city.dart';
import 'package:weather_app/weather/data/models/weather.dart';

/// An interface that handles operations related to the weather.
abstract class IWeatherReportRepository {
  /// Searches a city by its [name].
  Future<List<City>> findCity(String name);

  /// Gets weather reports for the next couple of days in the specified [city].
  Future<List<Weather>> getWeatherReports(City city);
}
