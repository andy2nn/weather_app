// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      forecastday: (json['forecast']['forecastday'] as List<dynamic>)
          .map((e) => ForecastDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'forecastday': instance.forecastday,
    };

ForecastHours _$ForecastHoursFromJson(Map<String, dynamic> json) =>
    ForecastHours(
      time: DateTime.parse(json['time'] as String),
      tempC: (json['temp_c'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastHoursToJson(ForecastHours instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'temp_c': instance.tempC,
      'condition': instance.condition,
    };

ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) => ForecastDay(
      date: DateTime.parse(json['date'] as String),
      day: Day.fromJson(json['day'] as Map<String, dynamic>),
      forecastHours: (json['hour'] as List<dynamic>)
          .map((e) => ForecastHours.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDayToJson(ForecastDay instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'day': instance.day,
      'hour': instance.forecastHours,
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      maxtempC: (json['maxtemp_c'] as num).toDouble(),
      mintempC: (json['mintemp_c'] as num).toDouble(),
      avgtempC: (json['avgtemp_c'] as num).toDouble(),
      maxwindKph: (json['maxwind_kph'] as num).toDouble(),
      dailyChanceOfRain: (json['daily_chance_of_rain'] as num).toInt(),
      dailyChanceOfSnow: (json['daily_chance_of_snow'] as num).toInt(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'maxtemp_c': instance.maxtempC,
      'mintemp_c': instance.mintempC,
      'avgtemp_c': instance.avgtempC,
      'maxwind_kph': instance.maxwindKph,
      'daily_chance_of_rain': instance.dailyChanceOfRain,
      'daily_chance_of_snow': instance.dailyChanceOfSnow,
      'condition': instance.condition,
    };
