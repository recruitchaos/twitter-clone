import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SvgPicture.asset(
          'assets/icon.svg',
          width: 30,
          height: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
          
            Text("See what's happening in the world right now.", style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.left,),
            Text("Have an account already?", style: Theme.of(context).textTheme.displaySmall,)
          ],
        ),
      ),
    );
  }
}
