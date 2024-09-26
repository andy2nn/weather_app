import 'package:flutter/material.dart';
import 'package:weather_app/ui/navigation/navigation.dart';

void main() {
  runApp(const _WeatherApp());
}

class _WeatherApp extends StatelessWidget {
  const _WeatherApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Navigation.routes,
      initialRoute: Navigation.initialRoute,
    );
  }
}
