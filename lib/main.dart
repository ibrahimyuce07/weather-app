import 'package:flutter/material.dart';
import 'package:weather_app/views/city_screen.dart';
import 'package:weather_app/views/loading_screen.dart';
import 'package:weather_app/views/location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}


  

