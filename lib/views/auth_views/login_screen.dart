import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/custom_widgets/custom_button_2.dart';
import 'package:twitter_clone/custom_widgets/custom_text_field.dart';
import 'package:twitter_clone/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signInUser() async {
    //get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try{
      await authService.signInWithEmailandPassword(emailController.text, passwordController.text);
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/icon.svg', width: 30, height: 30,),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Text("Enter your credentials", style: Theme.of(context).textTheme.displayMedium,),
            const SizedBox(height: 20,),
            CustomTextField(label: 'Email', icon: const Icon(Icons.email), controller: emailController, isObscure: false,),
            const SizedBox(height: 20,),
            CustomTextField(label: 'Password', icon: const Icon(Icons.remove_red_eye), controller: passwordController, isObscure: true,),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton2(backgroundColor: Colors.white, textColor: Colors.black, label: 'Forgot password?',),
                  GestureDetector(
                    onTap: signInUser,
                    child: CustomButton2(backgroundColor: Color(0xff1C9BEF), textColor: Colors.white, label: 'Log In'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}