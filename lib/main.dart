import 'package:flutter/material.dart';
import 'package:weather_app/res/colors/app_color.dart';
import 'package:weather_app/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.colorOne),
      ),
      home: const SplashScreen(),
    );
  }
}
