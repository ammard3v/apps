import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather.dart';

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String api_key;

  WeatherService(this.api_key);

  // Fetch the weather for a specific city
  Future<Weather> getWeather(String cityName) async {
    final url = '$BASE_URL?q=$cityName&appid=$api_key&units=metric';
    final response = await http.get(Uri.parse(url));

    print('Fetching weather for "$cityName"...');
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        return Weather.fromJson(jsonDecode(response.body));
      } catch (e) {
        print('Error parsing weather data: $e');
        throw Exception('Malformed weather data');
      }
    } else {
      print('Error response: ${response.statusCode}');
      throw Exception('Failed to load weather data');
    }
  }

  // Get current city based on the device's location
  Future<String> getCurrentCity() async {
    // Check location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    print('Current permission: $permission');

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Geolocator.openAppSettings(); // Open settings to enable permission manually
      throw Exception('Location permissions are permanently denied');
    }

    // Fetch position
    try {
      print('Fetching position...');
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print('Fetched position: $position');

      // Get the placemarks (city) based on the position
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        String city = placemarks[0].locality ?? 'Unknown City';
        print('Detected city: $city');
        return city;
      } else {
        throw Exception('No placemarks found');
      }
    } catch (e) {
      print('Error getting location: $e');
      throw Exception('Error retrieving location');
    }
  }
}
