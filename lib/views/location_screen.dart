import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, this.locationWeather}) : super(key: key);

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late var temperature;
  late int condition;
  late String cityName;
  late var weatherIcon;
  late String weatherMessage;
  late var minTemp;
  late var maxTemp;
  late double windSpeed;
  late int windDirection;
  late int humidity;
  late String description;
  late String icon;
  late var feelsLike;

  @override
  void initState() {
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      temperature = weatherData['main']['temp'];
      //round
      temperature = temperature.round();
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      description = weatherData['weather'][0]['description'];
      humidity = weatherData['main']['humidity'];
      windSpeed = weatherData['wind']['speed'];
      windDirection = weatherData['wind']['deg'];
      weatherIcon = weatherData['weather'][0]['icon'];
      weatherMessage = weatherData['weather'][0]['description'];
      minTemp = weatherData['main']['temp_min'];
      minTemp = minTemp.round();
      maxTemp = weatherData['main']['temp_max'];
      maxTemp = maxTemp.round();
      icon = weatherIcon = weatherData['weather'][0]['icon'];
      feelsLike = weatherData['main']['feels_like'];
      feelsLike = feelsLike.round();

      updateWeatherIcon(condition, weatherIcon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          child: FaIcon(
            updateWeatherIcon(condition, weatherIcon),
            size: 50,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('images/city_background-1.jpg'),
              fit: BoxFit.cover,
              //make image darker

              // colorFilter: ColorFilter.mode(
              //   Colors.black.withOpacity(0.7),
              //   BlendMode.darken,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7),
                blendModDayNight(),
              ),
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.near_me,
                        size: 40.0,
                        color: Colors.blue,
                      ),
                    ),
                    Column(
                      children: [
                        const Icon(
                          CupertinoIcons.wind,
                          size: 50.0,
                          color: Colors.white54,
                        ),
                        Text(
                          '${windSpeed.toInt()} m/s ',
                          style: GoogleFonts.ubuntu(
                            color: Colors.white54,
                          ),
                        )
                      ],
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.searchLocation,
                        size: 40.0,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 2, 2),
                  child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: <Widget>[
                          AutoSizeText(
                            '${temperature}°',
                            style: kTempTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '${minTemp}°',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 36.0,
                                  color: Colors.white54,
                                ),
                              ),
                              Text(
                                '${maxTemp}°',
                                style: const TextStyle(
                                  fontSize: 36.0,
                                  color: Colors.white54,
                                ),
                              ),
                              Text(
                                '${humidity.toInt()}%',
                                style: const TextStyle(
                                  fontSize: 36.0,
                                  color: Colors.white54,
                                ),
                              ),
                              Text(
                                '$feelsLike°',
                                style: const TextStyle(
                                  fontSize: 36.0,
                                  color: Colors.white54,
                                ),
                              ),

                            ],
                          ), //text
                          Column(
                            children: const [
                              Icon(
                                CupertinoIcons.thermometer_snowflake,
                                size: 36.0,
                                color: Colors.white54,
                              ),
                              Icon(
                                CupertinoIcons.thermometer_sun,
                                size: 36.0,
                                color: Colors.white54,
                              ),
                              Icon(
                                CupertinoIcons.drop,
                                size: 36.0,
                                color: Colors.white54,
                              ),
                              Icon(
                                CupertinoIcons.thermometer,
                                size: 36.0,
                                color: Colors.white54,
                              ),
                            ],
                          ),
                        ],
                      ),
                      //degrees
                    ],
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 5.0, 5.0, .0),
                      child: Text(
                        "$cityName bu ${_getDayOrNight()} $description.",
                        textAlign: TextAlign.right,
                        maxLines: 5,
                        style: GoogleFonts.ubuntu(
                          fontSize: 76.0,
                          shadows: [
                            const Shadow(
                              blurRadius: 10.0,
                              color: Colors.white54,
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlendMode blendModDayNight() {
    var currentTime = DateTime.now().hour;
    if (currentTime <= 6 || currentTime >= 22) {
      return BlendMode.darken;
    } else {
      return BlendMode.dstATop;
    }
  }

  _getDayOrNight() {
    var currentTime = DateTime.now().hour;
    if (currentTime <= 6 || currentTime >= 22) {
      return 'gece';
    } else if (currentTime <= 12) {
      return 'sabah';
    } else if (currentTime <= 18) {
      return 'gün';
    } else if (currentTime < 22) {
      return 'akşam';
    }
  }

  _getConditionMessage() {
    if (description == 'clear sky') {
      return 'açık.';
    } else if (description == 'few clouds') {
      return 'az bulutlu.';
    } else if (description == 'scattered clouds') {
      return 'dağınık bulutlu.';
    } else if (description == 'broken clouds') {
      return 'yer yer bulutlu.';
    } else if (description == 'shower rain') {
      return 'sağanak yağmurlu.';
    } else if (description == 'rain') {
      return 'yağmurlu.';
    } else if (description == 'thunderstorm') {
      return 'fırtınalı.';
    } else if (description == 'snow') {
      return 'kar yağışlı.';
    } else if (description == 'mist') {
      return 'sisli.';
    }
  }

  IconData updateWeatherIcon(int condition, weatherIcon) {
    if (condition < 300) {
      return FontAwesomeIcons.pooStorm;
    } else if (condition < 400) {
      return FontAwesomeIcons.cloudRain;
    } else if (condition < 600) {
      return FontAwesomeIcons.cloudRain;
    } else if (condition < 700) {
      return FontAwesomeIcons.snowflake;
    } else if (condition < 800) {
      return FontAwesomeIcons.smog;
    } else if (condition == 800) {
      return FontAwesomeIcons.solidSun;
    } else if (condition <= 804) {
      return FontAwesomeIcons.cloud;
    } else {
      return weatherIcon;
    }
  }
}
