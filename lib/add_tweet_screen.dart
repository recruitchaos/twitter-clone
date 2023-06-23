import 'package:flutter/material.dart';
import 'package:twitter_clone/custom_widgets/custom_button_2.dart';

class AddTweetScreen extends StatefulWidget {
  const AddTweetScreen({super.key});

  @override
  State<AddTweetScreen> createState() => _AddTweetScreenState();
}

class _AddTweetScreenState extends State<AddTweetScreen> {

  TextEditingController tweetController = TextEditingController();
  bool hasTyped = false;

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    tweetController.addListener(hasTypedAnything);
  }

  void hasTypedAnything() {
    if(tweetController.text.isNotEmpty) {
      setState(() {
      hasTyped = true;
    });
    }
  }

  void makeTweet() {

  }

  @override
  void dispose() {
    // TODO: implement dispose
    tweetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.close), onPressed: () { Navigator.pop(context); },),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: hasTyped ? makeTweet : () {},
              child: CustomButton2(label: 'Tweet', backgroundColor: hasTyped ? Color(0xff1C9BEF) : Color(0xff1C9BEF).withOpacity(0.6), textColor: Colors.white)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 24,),
              Row(
                children: [
                  CircleAvatar(radius: 24,),
                ],
              ),
              SizedBox(height: 16,),
               TextField(
                autofocus: true,
                maxLines: null,
                controller: tweetController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "What's happening?"
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}