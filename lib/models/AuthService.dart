
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'User.dart';

class AuthService{
  
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

 /*
  User _userFromFirebase(FirebaseUser user){
    return user!=null ? User(uid:user.uid)
  }*/
  
  /*
  Future signInAnnon() async{

    try{
      AuthResult result= await _auth.signInAnonymously();
      FirebaseUser user= result.user;
      return _userFromFirebase(user);
    }catch(e){
      print (e.toString());
      return null;
    }
  }*/


  Future<String> signIn(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }



  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }





  /*
  Future<String> signUp(String email, String password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }
*/
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _auth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _auth.currentUser();
    return user.isEmailVerified;
  }




}