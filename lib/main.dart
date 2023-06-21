import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/services/auth_api.dart';
import 'package:twitter_clone/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: const MyApp()));
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
          displayLarge: TextStyle(fontSize: 26),
          displayMedium: TextStyle(fontSize: 24),
          displaySmall: TextStyle(fontSize: 16),
          bodySmall: TextStyle(fontSize: 12),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthAPI(),
    );
  }
}

