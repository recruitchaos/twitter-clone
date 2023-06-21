import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/custom_widgets/custom_button.dart';
import 'package:twitter_clone/custom_widgets/custom_text_field.dart';
import 'package:twitter_clone/services/auth_service.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void signUp() async {
    if(passwordController.text!=confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password doesn't match!")));
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try{
      await authService.signUpWithEmailandPassword(emailController.text, passwordController.text, usernameController.text, nameController.text);
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/icon.svg',
          height: 30,
          width: 30,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Create your account",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  CustomTextField(label: 'Username', controller: usernameController, isObscure: false,),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(label: 'Name', controller: nameController, isObscure: false,),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(label: 'Email', controller: emailController, isObscure: false,),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(label: 'Password', controller: passwordController, isObscure: true,),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      label: 'Confirm Password', controller: confirmPasswordController, isObscure: true,),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: GestureDetector(
                      onTap: signUp,
                      child: CustomButton(label: 'Sign up', backgroundColor: Color(0xff1C9BEF), textColor: Colors.white)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
