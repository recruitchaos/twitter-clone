import 'package:flutter/material.dart';
import 'package:twitter_clone/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1C9BEF)),
        useMaterial3: true,
        fontFamily: 'Gilroy',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 30),
          displayMedium: TextStyle(fontSize: 24),
          displaySmall: TextStyle(fontSize: 16),
        ),
      ),
      home: const WelcomePage(),
    );
  }
}

