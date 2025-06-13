import 'package:flutter/material.dart';
import 'package:weather_app/application/model/current_weather.dart';
import 'package:weather_app/application/service/weather_service.dart';

class HomeController {
  final WeatherService weatherService;

  HomeController(this.weatherService);

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  CurrentWeather? currentWeather;
  ValueNotifier<String?> error = ValueNotifier(null);

  Future<void> getCurrentWeather({String? city}) async {
    error.value = null;
    try {
      isLoading.value = true;
      currentWeather = await weatherService.getCurrentWeather(
        city: city ?? "faisalabad",
      );
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
