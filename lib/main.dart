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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Gilroy',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 30),
          displayMedium: TextStyle(fontSize: 20),
          displaySmall: TextStyle(fontSize: 16),
        )
      ),
      home: const WelcomePage(),
    );
  }
}

