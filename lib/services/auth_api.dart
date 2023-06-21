import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/welcome_page.dart';

import '../homepage.dart';

class AuthAPI extends StatelessWidget {
  const AuthAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //USER IS LOGGED IN
          if(snapshot.hasData) {
            return const HomePage();
          }
          else {
            return const WelcomePage();
          }
        },
      ),
    );
  }
}