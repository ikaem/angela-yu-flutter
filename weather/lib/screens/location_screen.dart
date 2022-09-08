import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationWeather;

  const LocationScreen({Key? key, required this.locationWeather})
      : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temperature;
  int? condition;
  String? cityName;
  bool isRefetchingWeather = false;

  final weather = WeatherModel();

  void updateUI(dynamic weatherData) {
    //TODO test
    // weatherData = null;
    if (weatherData == null) {
      setState(() {
        temperature = 0;
        condition = -1;
        cityName = "";
      });

      return;
    }
    setState(() {
      temperature = weatherData["main"]["temp"].toInt();
      condition = weatherData["weather"][0]["id"];
      cityName = weatherData["name"];
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/location_background.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isRefetchingWeather
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircularProgressIndicator(),
                        )
                      : IconButton(
                          onPressed: () async {
                            setState(() {
                              isRefetchingWeather = true;
                            });
                            final weatherData =
                                await weather.getLocationWeather();
                            updateUI(weatherData);
                            setState(() {
                              isRefetchingWeather = false;
                            });
                          },
                          icon: const Icon(
                            Icons.near_me,
                            size: 50.0,
                          ),
                        ),
                  IconButton(
                    onPressed: () async {
                      final city = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );

                      if (city == null) return;

                      final weatherData = await weather.getCityWeather(city);

                      updateUI(weatherData);
                    },
                    icon: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temperature}°',
                      // style: kTempTextStyle,
                    ),
                    Text(
                      '${weather.getWeatherIcon(condition)}',
                      // style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's ${weather.getMessage(temperature)} time in $cityName!",
                  textAlign: TextAlign.right,
                  // style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
