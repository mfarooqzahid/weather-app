import 'package:flutter/material.dart';

import 'package:weather_app/application/controller/home_controller.dart';
import 'package:weather_app/application/core/assets/images.dart';
import 'package:weather_app/application/service/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController homeController;

  @override
  void initState() {
    homeController = HomeController(WeatherService());
    homeController.getCurrentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: NotificationListener(
            onNotification: (OverscrollIndicatorNotification notification) {
              notification.disallowIndicator();
              return true;
            },
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchBar(
                    hintText: "Search: e.g. Faisalabad",
                    textInputAction: TextInputAction.search,
                    leading: Icon(Icons.search),
                    onSubmitted: (value) {
                      homeController.getCurrentWeather(city: value);
                    },
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: homeController.error,
                  builder: (_, error, __) {
                    return ValueListenableBuilder(
                      valueListenable: homeController.isLoading,
                      builder: (_, isLoading, __) {
                        // handled loading
                        return isLoading
                            ? Center(
                              child: Text(
                                'Loading...',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey.shade400,
                                  fontSize: 16,
                                ),
                              ),
                            )
                            // handled error
                            // if there is an error then show the error message
                            : error != null
                            ? Center(child: Text(error))
                            // at last on data show the weather data
                            : Column(
                              children: [
                                SizedBox.square(
                                  dimension: 230,
                                  child: Image.asset(
                                    fit: BoxFit.contain,
                                    Images.getWeatherImage(
                                      condition:
                                          homeController
                                              .currentWeather
                                              ?.condition ??
                                          "",
                                      isDay:
                                          homeController
                                              .currentWeather
                                              ?.isDay ??
                                          1,
                                    ),
                                  ),
                                ),
                                // current city
                                Text(
                                  homeController.currentWeather?.locationName ??
                                      "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                // Temprature
                                Text(
                                  "${homeController.currentWeather?.tempCelcius ?? 0.0}°C",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 56,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                // Weather Condition
                                Text(
                                  homeController.currentWeather?.condition ??
                                      "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.air_rounded),
                                        title: Text(
                                          "${homeController.currentWeather?.windKph ?? 0}",
                                        ),
                                        subtitle: Text("Wind Speed (kph)"),
                                      ),
                                      Divider(),

                                      ListTile(
                                        leading: Icon(Icons.air_rounded),
                                        title: Text(
                                          "${homeController.currentWeather?.windMph ?? 0}",
                                        ),
                                        subtitle: Text("Wind Speed (mph)"),
                                      ),
                                      Divider(),
                                      ListTile(
                                        leading: Icon(
                                          Icons.water_drop_outlined,
                                        ),
                                        title: Text(
                                          "${homeController.currentWeather?.humidity ?? 0}",
                                        ),
                                        subtitle: Text("Humadity"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
