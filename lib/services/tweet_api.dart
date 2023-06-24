import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/tweet_model.dart';

class TweetApi extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //POST TWEET
  Future<void> postTweet(String tweetContent, String name, String id) async {
    final String currentUserID = _firebaseAuth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

    //POST
    Tweet newTweet = Tweet(tweetContent: tweetContent, id: id, name: name, timestamp: timestamp);

    //ADD TO DATABASE
    await _firestore.collection('tweets').doc(currentUserID).collection('tweet').add(newTweet.toMap());
  }

  //GET TWEETS
  Stream<QuerySnapshot> getTweets() {
    final String currentUserID = _firebaseAuth.currentUser!.uid;
    return _firestore.collection('tweets').doc(currentUserID).collection('tweet').orderBy('timestamp', descending: false).snapshots();
  }
}