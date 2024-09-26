import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ui/api/api_models/weather.dart';
import 'package:weather_app/ui/widgets/main_page/main_page_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  // final _apiClient = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Weather>(
          // future: _apiClient.getWeather(),
          future:
              context.read<MainPageModel>().setup(), // Здесь выполняется запрос
          builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Пока данные загружаются
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Если произошла ошибка
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              // Данные успешно загружены
              Weather weather = snapshot.data!;
              return _View(weather: weather);
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}

class _View extends StatelessWidget {
  const _View({required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _TitleLocation(weather: weather),
            _WeatherLocationInfo(weather: weather),
            _LocaataionInfo(weather: weather),
            const SizedBox(height: 30),
            const _DaysForecasts()
          ],
        ),
      ),
    );
  }
}

class _DaysForecasts extends StatelessWidget {
  const _DaysForecasts();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 35, 116, 255),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          height: 250,
          child: ListView.builder(
            itemCount:
                context.read<MainPageModel>().forecast.forecastday.length,
            itemBuilder: (BuildContext context, int index) {
              final daysForecast =
                  context.read<MainPageModel>().forecast.forecastday[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: 115,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 60, 235),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 0.5,
                          offset: const Offset(3, 3),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${daysForecast.date.day}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text('Avarage temp ${daysForecast.day.avgtempC} °С',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text(daysForecast.day.condition.text,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(width: 25),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https:${daysForecast.day.condition.icon}',
                              width: 85,
                              height: 85,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LocaataionInfo extends StatelessWidget {
  const _LocaataionInfo({required this.weather});
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 410,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 35, 116, 255),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(weather.location.name,
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.w700)),
            Text(
              weather.location.region,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            Text(
              weather.location.country,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Day forecast:',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ],
            ),
            const _ForecastList()
          ],
        ),
      ),
    );
  }
}

class _ForecastList extends StatelessWidget {
  const _ForecastList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        itemCount: context
            .read<MainPageModel>()
            .forecast
            .forecastday[0]
            .forecastHours
            .length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final forecastHours = context
              .read<MainPageModel>()
              .forecast
              .forecastday[0]
              .forecastHours[index];
          final double tempC = forecastHours.tempC;
          final icon = forecastHours.condition.icon;
          final DateTime time = forecastHours.time;
          final textForecast = forecastHours.condition.text;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 1,
                        offset: const Offset(3, 3))
                  ],
                  color: const Color.fromARGB(255, 26, 60, 235),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Text(
                      '${time.hour}:00',
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w600),
                    ),
                    Image.network('https:$icon'),
                    Text(
                      '$tempC °С',
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      textForecast,
                      style: const TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WeatherLocationInfo extends StatelessWidget {
  const _WeatherLocationInfo({
    required this.weather,
  });
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    final url = weather.current.condition.icon;
    final localWeather = weather.current.tempC;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https:$url', width: 70, height: 70),
              const SizedBox(width: 20),
              Text('$localWeather °С',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w700))
            ],
          ),
        ],
      ),
    );
  }
}

class _TitleLocation extends StatelessWidget {
  const _TitleLocation({required this.weather});
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    final chanceRain = context
        .read<MainPageModel>()
        .forecast
        .forecastday[0]
        .day
        .dailyChanceOfRain;
    return Column(
      children: [
        Text(weather.current.condition.text,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
        Text('Rain chance $chanceRain %',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
