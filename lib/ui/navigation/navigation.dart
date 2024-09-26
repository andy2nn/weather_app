import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ui/widgets/main_page/main_page.dart';
import 'package:weather_app/ui/widgets/main_page/main_page_model.dart';

class NavigationNames {
  static const String main = '/';
}

class Navigation {
  static const initialRoute = NavigationNames.main;

  static final routes = <String, Widget Function(BuildContext)>{
    NavigationNames.main: (context) => Provider(
        create: (BuildContext context) => MainPageModel(),
        lazy: true,
        child: const MainPage()),
  };
}
