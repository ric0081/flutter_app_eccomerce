import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_eccomerce/createUser.dart';
import 'package:flutter_app_eccomerce/pages/account_page.dart';
import 'package:flutter_app_eccomerce/pages/home.dart';
import 'package:flutter_app_eccomerce/pages/income.dart';
import 'package:flutter_app_eccomerce/pages/loginState.dart';
import 'package:flutter_app_eccomerce/services/VuOperations.dart';
import 'package:flutter_app_eccomerce/utils/colors.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login.dart';
import 'package:provider/provider.dart';

import 'gallery/gallery_options.dart';
import 'gallery/letter_spacing.dart';

GetIt locator = GetIt.instance;

void main(){
  // GetIt.instance.registerLazySingleton<VuOperations>(VuOperations());
  //GetIt.I.registerLazySingleton(() => VuOperations());
  locator.registerLazySingleton(() => VuOperations());
  runApp(MateriaApp());
} //=> runApp(MateriaApp());

class MateriaApp extends StatelessWidget {

    final sharedZAxisTransitionBuilder = const SharedAxisPageTransitionsBuilder(
      fillColor: RallyColors.primaryBackground,
      transitionType: SharedAxisTransitionType.scaled,
    );

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider<LoginState>(
            builder: (BuildContext context) => LoginState(),

            child: MaterialApp(
                title: "APP BANK",
                debugShowCheckedModeBanner: false,
                 // home: Home(),
                  theme: ThemeData(
                      accentColor: Colors.white70
                  ),
                  routes: {

                  '/': (BuildContext context) {
                      var state=Provider.of<LoginState>(context);

                      if (state.isLoggedIn()) {
                            return HomePage();
                          }else{
                            return LoginPage();
                          }
                      },
                    '/second': (context) => CreateUser(),
                    '/account_page':(context)=>AccountPage(),
                    //                    '/add'
                    },
                  )
            );
      }
  }




ThemeData _buildRallyTheme() {
  final base = ThemeData.dark();
  return ThemeData(
    appBarTheme: const AppBarTheme(brightness: Brightness.dark, elevation: 0),
    scaffoldBackgroundColor: RallyColors.primaryBackground,
    primaryColor: RallyColors.primaryBackground,
    focusColor: RallyColors.focusColor,
    textTheme: _buildRallyTextTheme(base.textTheme),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: RallyColors.gray,
        fontWeight: FontWeight.w500,
      ),
      filled: true,
      fillColor: RallyColors.inputBackground,
      focusedBorder: InputBorder.none,
    ),
  );
}


TextTheme _buildRallyTextTheme(TextTheme base) {
  return base
      .copyWith(
    bodyText2: GoogleFonts.robotoCondensed(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: letterSpacingOrNone(0.5),
    ),
    bodyText1: GoogleFonts.eczar(
      fontSize: 40,
      fontWeight: FontWeight.w400,
      letterSpacing: letterSpacingOrNone(1.4),
    ),
    button: GoogleFonts.robotoCondensed(
      fontWeight: FontWeight.w700,
      letterSpacing: letterSpacingOrNone(2.8),
    ),
    headline5: GoogleFonts.eczar(
      fontSize: 40,
      fontWeight: FontWeight.w600,
      letterSpacing: letterSpacingOrNone(1.4),
    ),
  )
      .apply(
    displayColor: Colors.white,
    bodyColor: Colors.white,
  );
}

