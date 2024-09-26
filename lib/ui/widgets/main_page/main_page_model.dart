import 'package:weather_app/ui/api/api_client.dart';
import 'package:weather_app/ui/api/api_models/forecast.dart';
import 'package:weather_app/ui/api/api_models/weather.dart';

class MainPageModel {
  late Forecast forecast;
  final _apiClient = ApiClient();

  Future<Weather> setup() async {
    forecast = await _apiClient.getForecast();
    return await _apiClient.getWeather();
  }
}
