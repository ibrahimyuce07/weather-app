import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    Response response = await get(Uri.parse(url));

    //get background image data:
    //https://api.teleport.org/api/locations/36.8763767%2C30.7234986/ //get geoid here
    //https://api.teleport.org/api/cities/geonameid:323777/


    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
