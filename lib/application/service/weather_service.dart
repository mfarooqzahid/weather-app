import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/application/model/current_weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<CurrentWeather> getCurrentWeather({required String city}) async {
    try {
      final key = dotenv.env["KEY"];
      final uri = Uri.https("api.weatherapi.com", "/v1/current.json", {
        "key": key,
        "q": city,
      });
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final currentWeather = CurrentWeather.fromJson(response.body);

        log(currentWeather.toString());
        return currentWeather;
      } else {
        final errorData = jsonDecode(response.body);
        final message = errorData['error']?['message'] ?? "Unexpected error";
        throw http.ClientException(message);
      }
    } on http.ClientException catch (e) {
      log("ClientException: $e");
      throw Exception(e.message);
    } catch (e) {
      log("Unknown error: $e");
      throw Exception("Something went wrong. Please try again.");
    }
  }
}
