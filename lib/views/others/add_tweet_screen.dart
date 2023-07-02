import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/custom_widgets/custom_button_2.dart';
import 'package:twitter_clone/services/tweet_api.dart';

class AddTweetScreen extends StatefulWidget {
  const AddTweetScreen({super.key});

  @override
  State<AddTweetScreen> createState() => _AddTweetScreenState();
}

class _AddTweetScreenState extends State<AddTweetScreen> {

  TextEditingController tweetController = TextEditingController();
  bool hasTyped = false;
  late String name;
  late String myID;
  final TweetApi _tweetApi = TweetApi();

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    tweetController.addListener(hasTypedAnything);
    _fetch();
  }

  void hasTypedAnything() {
    if(tweetController.text.isNotEmpty) {
      setState(() {
      hasTyped = true;
    });
    }
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null) {
      await FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).get().then((value) {
        myID = value.data()!['uid'] ?? '';
        name = value.data()!['name'] ?? '';
      }).catchError((e){
        print(e);
      });
    }
  }

  void makeTweet() async{
    if(tweetController.text.isNotEmpty) {
      await _tweetApi.postTweet(tweetController.text, name, myID);
      tweetController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Tweeted!")));
      Navigator.pop(context);
      print('successful');
    }
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