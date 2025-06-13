class Images {
  static const String _basePath = "assets";

  static String partiallyCloudyDay = "$_basePath/partially_cloudy_day.png";
  static String cloudyNight = "$_basePath/cloudy_night.png";
  static String windyNight = "$_basePath/windy_night.png";
  static String windyDay = "$_basePath/windy_day.png";
  static String sunny = "$_basePath/sunny.png";
  static String mistDay = "$_basePath/mist_day.png";
  static String temperature = "$_basePath/temprature.png";

  static String getWeatherImage({
    required String condition,
    required int isDay,
  }) {
    final lowerCondition = condition.toLowerCase();

    if (isDay == 0) {
      if (lowerCondition.contains('cloud')) return cloudyNight;
      if (lowerCondition.contains('wind')) return windyNight;
      if (lowerCondition.contains('mist')) return mistDay;
      return temperature;
    } else {
      if (lowerCondition.contains('cloud')) return partiallyCloudyDay;
      if (lowerCondition.contains('sun') || lowerCondition.contains('clear')) {
        return sunny;
      }
      if (lowerCondition.contains('wind')) return windyDay;
      if (lowerCondition.contains('mist')) return mistDay;
      return temperature;
    }
  }
}
