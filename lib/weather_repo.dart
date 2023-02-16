import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/providers/weather.dart';

class WeatherRepo {
  Future<Weather> getCurrentWeather(String city) async {
    const api = '35ea804205b84af8a7955237231602';
    var url = '/current.json';
    // var city = 'Karachi';
    var result;

    try {
      result = await Dio().get("http://api.weatherapi.com/v1/current.json",
          queryParameters: {'q': city, 'key': api, 'aqi': 'no'}).then((value) {
        result = Weather(
            city: value.data['location']['name'],
            country: value.data['location']['country'],
            lastUpdated: DateTime.parse(
                value.data['current']['last_updated'].substring(0, 12) +
                    "0" +
                    value.data['current']['last_updated'].substring(
                        13, value.data['current']['last_updated'].length) +
                    ":00"),
            tempCel: value.data['current']['temp_c'].toString(),
            name: value.data['current']['condition']['text'],
            humidity: value.data['current']['humidity'].toString(),
            feelsLike: value.data['current']['feelslike_c'].toString(),
            uv: value.data['current']['uv'].toString());
        return result;
      });
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Weather parsedJson(final response) {
    print('here1');
    print(response.toString());
    print('here');
    final jsonDecoded = json.decode(response.toString());
    final jsonWeather = jsonDecoded["data"];

    return Weather.fromJson(jsonWeather);
  }
}
