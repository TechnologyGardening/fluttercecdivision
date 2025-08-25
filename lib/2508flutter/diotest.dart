import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio _dio = Dio();
  final String _baseURL = 'https://api.openweathermap.org/data/2.5/weather';
  final String _apikey = '28d16360c02d9aa3fc9306aae105fc31';

  Future<String> getWeatherData(String city) async {
    try {
      final response = await _dio.get(_baseURL, queryParameters: {
        'q': city,
        'appid': _apikey,
        'units': 'metric',
      });
      return response.data.toString();
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}

class WeatherData extends StatefulWidget {
  const WeatherData({super.key});

  @override
  State<WeatherData> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
  String data1 = 'Loading....';
  WeatherService v1 = WeatherService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: fetchWeather, child: const Text('Fetch Weather')),
          const SizedBox(
            height: 20,
          ),
          Text(data1),
        ],
      )),
    );
  }

  void fetchWeather() async {
    String data = await v1.getWeatherData('Rajkot');
    setState(() {
      data1 = data;
    });
  }
}
