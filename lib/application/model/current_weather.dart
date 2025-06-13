import 'dart:convert';

class CurrentWeather {
  final String locationName;
  final double tempCelcius;
  final double tempFahrenheit;
  final String condition;
  final int isDay;
  final double windKph;
  final double windMph;
  final int humidity;
  final int cloud;
  CurrentWeather({
    required this.locationName,
    required this.tempCelcius,
    required this.tempFahrenheit,
    required this.condition,
    required this.isDay,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.cloud,
  });

  factory CurrentWeather.fromMap(Map<String, dynamic> map) {
    return CurrentWeather(
      locationName: map['location']['name'] as String,
      tempCelcius: map['current']['temp_c'] as double,
      tempFahrenheit: map['current']['temp_f'] as double,
      condition: map['current']['condition']['text'] as String,
      isDay: map['current']['is_day'] as int,
      windKph: map['current']['wind_kph'] as double,
      windMph: map['current']['wind_mph'] as double,
      humidity: map['current']['humidity'] as int,
      cloud: map['current']['cloud'] as int,
    );
  }
  factory CurrentWeather.fromJson(String source) =>
      CurrentWeather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrentWeather(locationName: $locationName, tempCelcius: $tempCelcius, tempFahrenheit: $tempFahrenheit, condition: $condition, isDay: $isDay, windKph: $windKph, windMph: $windMph, humidity: $humidity, cloud: $cloud)';
  }
}
