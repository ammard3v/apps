import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:weather/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class WeatherService {
  static const BASE_URL = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;
  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$BASE_URL?q=$cityName&appId=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('erroe');
    }
  }

  Future<String> getCurrentCity() async {
    // Check for location permission
    LocationPermission permission = await Geolocator.checkPermission();

    // Request permission if it is denied
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return 'Location permission denied';
      }
    }
    try {
      // Fetch current location without using desiredAccuracy
      Position position = await Geolocator.getCurrentPosition();

      // Convert location into a list of placemark objects
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      // Extract city name
      if (placemarks.isNotEmpty) {
        String? city = placemarks[0].locality;
        return city ?? 'City not found';
      } else {
        return 'No placemarks found';
      }
    } catch (e) {
      // Handle any errors that occur during location fetching
      return 'Error fetching location: $e';
    }
  }
}
