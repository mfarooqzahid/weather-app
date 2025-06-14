import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'application/presentation/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await dotenv.load();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        listTileTheme: ListTileThemeData(
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        searchBarTheme: SearchBarThemeData(
          elevation: WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          overlayColor: WidgetStatePropertyAll(Colors.white),
          side: WidgetStatePropertyAll(
            BorderSide(width: 1, color: Colors.grey.shade400),
          ),
          padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          hintStyle: WidgetStatePropertyAll(
            TextStyle(fontStyle: FontStyle.italic, color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
