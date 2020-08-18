import 'dart:convert';
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_eccomerce/models/BaseAuth.dart';
import 'package:flutter_app_eccomerce/pages/loginState.dart';
import 'package:flutter_app_eccomerce/services/VuOperations.dart';
import 'package:get_it/get_it.dart';
//import 'package:flutter_app_eccomerce/models/AuthService.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_eccomerce/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_eccomerce/utils/constants.dart';

import 'createUser.dart';
import 'models/AuthService.dart';
import 'package:flutter_app_eccomerce/gallery/gallery_options.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
  final Function onLoginSucess;
  const LoginPage({Key key, this.onLoginSucess}): super(key: key);
}
/*
Future<bool> saveNamePreference(String id) async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("token", id);
  return pref.commit();
}
*/

class _LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();

  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return
        Scaffold(
             // appBar: AppBar(automaticallyImplyLeading: false),
              body: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                          gradient: LinearGradient(
            //              colors: [Colors.blue.shade900, Colors.blue.shade900],
                          colors: [Colors.amber, Colors.orange],
                          begin: Alignment.bottomCenter,
                          end: Alignment.bottomCenter),
                          ),

                      child:
                          _isLoading ? Center(child: CircularProgressIndicator()) :ListView(
                           children: <Widget>[
                          headerSection(),
                          textSection(),
                          buttonSection(),
                          SizedBox(height: 30.0),

                          _buildSignInWithText(),
                          _buildSocialBtnRow(),
                          SizedBox(height: 10.0),

                          _buildSignupBtn(),
          ],
        ),
      ),
    )

    ;
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }



  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
                () => print('Login with Facebook'),
            AssetImage(
              'images/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
                () => print('Login with Google'),
            AssetImage(
              'images/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {

/*          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => createUser()),
                  (Route<dynamic> route) => false),*/
        print('Sign Up Button Pressed');
        Navigator.pushNamed(context, '/account_page');
        //Navigator.pushNamed(context, '/second');






///          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => CreateUser()), (Route<dynamic> route) =>false);
         // Navigator.push(context, MaterialPageRoute(builder:(context) => CreateUser()));
        /*final GlobalKey<NavigatorState> navigatorKey =
        new GlobalKey<NavigatorState>();
        navigatorKey.currentState.pushNamed('/second');
        */
        //       MaterialPageRoute(builder: (context) => CreateUser());
       //
        // final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
        /*new MaterialApp(
          title: 'MyApp',
          onGenerateRoute: generateRoute,
          navigatorKey: navigatorKey,
        );*/
//        navigatorKey.currentState.pushNamed('/second');
//        navigatorKey.currentState.pushNamed('/second');
 //       Navigator.of(context).pushNamed('/second');
       // Navigator.pushReplacementNamed(context, '/second');



      },
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Container(
            child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an Account? ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),

                      ),
                    ],
                  ),
                ),
          )
          ]
            ),
    );
  }








    /*
    var response = await http.post("https://run.mocky.io/v3/5da91b98-e536-4e66-8000-5d8c78092877", body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Home()),
                (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
    */


  Container buttonSection() {
    String userid;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: Consumer<LoginState>(
              builder:(BuildContext context, LoginState value, Widget child){
                  if(value.isLoadding()){
                      return CircularProgressIndicator();
                  }else{
                      return child;
                  }},
              child: RaisedButton(
                onPressed:
                emailController.text == "" || passwordController.text == "" ? null: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  dynamic result = await _auth.signInWithEmailAndPassword(emailController.text, passwordController.text);
                  if (result == null) {
                    setState(() {
                      print("Contrase;a incorrecta");
                      //error = 'Could not sign in with those credentials';
                    });
                  } else {
                    //  saveNamePreference(result);
                    print("ingreso al login");
                    print(emailController.text);
                    print(passwordController.text);
                    Provider.of<LoginState>(context).login(emailController.text, passwordController.text);
                    /*Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (BuildContext context) => Home()),
                              (Route<dynamic> route) => false);

                       */

                  }
                },

                elevation: 0.0,
                color: Colors.green,
                child: Text("Ingresar", style: TextStyle(color: Colors.white70)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),



          ),
    );
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            cursorColor: Colors.white,

            style: TextStyle(color: Colors.white70, ),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.white70),
              hintText: "Email",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
            validator: (value) => value.isEmpty ? 'Email no puede ser vacio' : null,
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white70, ),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white70),
              hintText: "Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
              validator: (value) => value.isEmpty ? 'La clave no puede ser vacia' : null,


          ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Bank",
          style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.bold)),
    );
  }
}
