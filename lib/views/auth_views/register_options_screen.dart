import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/views/auth_views/create_account_screen.dart';
import 'package:twitter_clone/custom_widgets/custom_button.dart';

import 'login_screen.dart';

class RegisterOptionScreen extends StatefulWidget {
  const RegisterOptionScreen({super.key});

  @override
  State<RegisterOptionScreen> createState() => _RegisterOptionScreenState();
}

class _RegisterOptionScreenState extends State<RegisterOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/icon.svg', height: 30, width: 30,),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.close), onPressed: () { Navigator.pop(context); },),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 150,),
              Text("Create your twitter account!", style: Theme.of(context).textTheme.displayLarge,),
              SizedBox(height: 30,),
              Text("Whether you need another account for work or just don't want your mom seeing your spicy takes, we got you.", style: Theme.of(context).textTheme.bodySmall?.apply(color: Colors.grey.shade700),),
              SizedBox(height: 250,),
              CustomButton(label: 'Continue with Google', backgroundColor: Colors.white, textColor: Colors.black),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('or', style: Theme.of(context).textTheme.bodySmall?.apply(color: Colors.grey.shade700),),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
                },
                child: CustomButton(label: 'Create Account', backgroundColor: Colors.black, textColor: Colors.white)),
              SizedBox(height: 40,),
              Text("By signing up, you agree to our ",style: Theme.of(context).textTheme.bodySmall?.apply(color: Colors.grey.shade700)),
              Text("Terms, Privacy Policy, and Cookie Use", style: Theme.of(context).textTheme.bodySmall?.apply(color: Color(0xff1C9BEF))),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}