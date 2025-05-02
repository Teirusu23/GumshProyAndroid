import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/challenge_screen.dart';
import 'package:flutter_application_1/Screens/dashboard_screen.dart';
import 'package:flutter_application_1/Screens/detailPopularMovie.dart';
import 'package:flutter_application_1/Screens/login_screen.dart';
import 'package:flutter_application_1/Screens/popular_screen.dart';
import 'package:flutter_application_1/Utils/global_values.dart';
import 'package:flutter_application_1/Utils/theme_settings.dart';
import 'package:flutter_application_1/network/api_popular.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GlobalValues.themeMode,
      builder: (context,value, widget) {
        return MaterialApp(
          theme: ThemeSettings.setTheme(value),
          home: const LoginScreen(),
          routes: {
            "/dash" : (context) => const DashboardScreen(),
            "/reto" : (context) => const ChallengeScreen(),
            "/api" : (context) => const PopularScreen(),
            "/detail": (context) => const DetailPopularMovie()
          },
    );  
      }
    );
  }
}