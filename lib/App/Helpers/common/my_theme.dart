import 'package:flutter/material.dart';

import 'my_colors.dart';


  get kAppThemeData => ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      brightness: Brightness.light,
      primaryColor: kPrimaryColor,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: kPrimaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      // accentColor: kAccentColor,
      iconTheme: IconThemeData(color: kBlack),
      fontFamily: "Quicksand",
      textTheme: TextTheme(
        headline1: TextStyle(
          color: kBlack,
        ),
        subtitle1: TextStyle(
          fontStyle: FontStyle.normal,
          color: kBlack,
        ),
        bodyText1: TextStyle(
          color: kBlack,
        ),
        subtitle2: TextStyle(
          color: kBlack,
        ),
      ),
    );
