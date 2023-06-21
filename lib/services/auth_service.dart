import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{
  //auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  //SIGN IN METHOD
  Future<UserCredential> signInWithEmailandPassword (String email, String password) async {
    try{
      //sign in
      UserCredential userCredential = await  _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  //SIGN UP METHOD
  Future<UserCredential> signUpWithEmailandPassword(String email, String password, String username, String name) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      _firestore.collection('users').doc(username).set({
        'uid' : username,
        'email' : email,
        'name' : name,
      });
      return userCredential;
    }
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}