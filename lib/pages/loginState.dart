import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginState with ChangeNotifier{
  bool _loggedIn= false;
  bool _loading= false;
  FirebaseUser _user;

  bool isLoggedIn() => _loggedIn;
  bool isLoadding() => _loading;
  FirebaseUser currentUser() =>_user;


  final FirebaseAuth auth =FirebaseAuth.instance;
  void login(String email, String pass) async{
    _loading =true;
    notifyListeners();
    _user= await signInWithEmailAndPassword(email,pass);
    _loading =false;
    if(_user!= null){
      print("logueado correctamente");
      _loggedIn=true;
      notifyListeners();
    }else{
      print("error en el logueo");
      _loggedIn=false;
      notifyListeners();
    }
  }

  void logout(){
    print("Se deslogueo");
    auth.signOut();
    _loggedIn=false;
    _loading =false;
    notifyListeners();
  }

  Future<FirebaseUser> signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }





  /*Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }*/


}