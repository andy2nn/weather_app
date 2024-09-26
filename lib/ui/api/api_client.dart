import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/ui/api/api_models/forecast.dart';
import 'package:weather_app/ui/api/api_models/weather.dart';

class ApiClient {
  static const String _url = 'http://api.weatherapi.com/v1';
  static const String _current = '/current.json';
  static const String _forecast = '/forecast.json';
  static const String _apiKey = '2fa54d32fff74849ab6170228240805';

  Future<Map<String, dynamic>> _get(Map<String, dynamic> param, path) async {
    var url = Uri.parse('$_url$path').replace(queryParameters: param);
    var response = await http.get(url);
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Weather> getWeather() async {
    Map<String, dynamic> param = {
      'key': _apiKey,
      'q': 'Paris',
    };
    var json = await _get(param, _current);
    return Weather.fromJson(json);
  }

  Future<Forecast> getForecast() async {
    Map<String, dynamic> param = {
      'key': _apiKey,
      'q': 'Paris',
      'days': '7',
    };
    var json = await _get(param, _forecast);
    return Forecast.fromJson(json);
  }
}
