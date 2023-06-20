import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/custom_widgets/custom_button.dart';
import 'package:twitter_clone/login_screen.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32,),
            Text("See what's happening in the world right now.", style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.left,),
            const SizedBox(height: 26,),
            const CustomButton(),
            const SizedBox(height:200,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have an account already? ", style: Theme.of(context).textTheme.displaySmall,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text("Login", style: Theme.of(context).textTheme.displaySmall?.apply(color: const Color(0xff1C9BEF)),))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
