import 'package:cloud_firestore/cloud_firestore.dart';

class Tweet {
  final String tweetContent;
  final String id;
  final String name;
  final Timestamp timestamp;

  Tweet({required this.tweetContent, required this.id, required this.name, required this.timestamp});

  Map<String, dynamic> toMap() {
    return{
      'tweetContent':tweetContent,
      'uid': id,
      'name': name,
      'timestamp' : timestamp,
    };
  }
}