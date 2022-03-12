import 'package:flutter/material.dart';

import '../constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background-1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 50.0,
                        color: Colors.white,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: null,
                ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Hava Durumunu Getir',
                style: kButtonTextStyle,
              ),
            ),
              ],
            )),
      ),
    );
  }
}
