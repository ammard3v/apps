import 'package:flutter/material.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService(
    'b3c19483ab3c7cff04878a9b79a236fa',
  ); // Replace with your OpenWeatherMap API key
  Weather? _weather;
  bool _isLoading = true;
  String? _errorMessage;

  // Fetch weather data for the current city
  _fetchWeather() async {
    try {
      // Get current city name
      String cityName = await _weatherService.getCurrentCity();
      // Fetch the weather data
      final weather = await _weatherService.getWeather(cityName);

      setState(() {
        _weather = weather;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load weather data. Please try again later.';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          _isLoading
              ? const CircularProgressIndicator()
              : _errorMessage != null
              ? Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 18),
                textAlign: TextAlign.center,
              )
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _weather!.cityName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${_weather!.temperature.round()} °C',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
    );
  }
}
