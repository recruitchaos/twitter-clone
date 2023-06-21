import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/services/auth_service.dart';
import 'package:twitter_clone/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/icon.svg', height: 30, width: 30,),
        leadingWidth: 40,
        leading: CircleAvatar(),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: signOut,),
        ],
      ),
    );
  }
}