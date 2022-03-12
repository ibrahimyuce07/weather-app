import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart';
import 'package:weather_app/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationService locationService = LocationService();
  var latitude = 41.015137;
  var longitude = 28.979530;
  var lang = 'tr';

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getLocationData() async {
    LocationService locationService = LocationService();
    await locationService.getCurrentLocation();
    latitude = locationService.latitude;
    longitude = locationService.longitude;
    latitude = 40.807457;
    longitude = 29.432911;
    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$weatherAPIKey&units=metric&lang=$lang');

    var weatherData = await networkHelper.getData();
    print(weatherData);
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(
              locationWeather: weatherData,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          duration: Duration(seconds: 3),
          size: 50.0,
        ),
      ),
    );
  }
}
