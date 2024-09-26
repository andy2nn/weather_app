import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/ui/api/api_models/weather.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final List<ForecastDay> forecastday;

  Forecast({required this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ForecastHours {
  final DateTime time;
  final double tempC;
  final Condition condition;

  ForecastHours(
      {required this.time, required this.tempC, required this.condition});

  factory ForecastHours.fromJson(Map<String, dynamic> json) =>
      _$ForecastHoursFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastHoursToJson(this);
}

@JsonSerializable()
class ForecastDay {
  final DateTime date;
  final Day day;
  @JsonKey(name: 'hour')
  final List<ForecastHours> forecastHours;

  ForecastDay(
      {required this.date, required this.day, required this.forecastHours});

  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Day {
  final double maxtempC;
  final double mintempC;
  final double avgtempC;
  final double maxwindKph;
  final int dailyChanceOfRain;
  final int dailyChanceOfSnow;
  final Condition condition;

  Day(
      {required this.maxtempC,
      required this.mintempC,
      required this.avgtempC,
      required this.maxwindKph,
      required this.dailyChanceOfRain,
      required this.dailyChanceOfSnow,
      required this.condition});

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
